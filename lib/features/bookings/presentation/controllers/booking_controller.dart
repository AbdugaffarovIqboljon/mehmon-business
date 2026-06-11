import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/features/bookings/data/datasources/booking_remote_data_source.dart';
import 'package:mehmon/features/bookings/data/repositories/booking_repository_impl.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/domain/repositories/booking_repository.dart';
import 'package:mehmon/features/bookings/domain/services/booking_conflict_resolver.dart';
import 'package:mehmon/features/floor/domain/services/table_status_resolver.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepositoryImpl(
    remoteDataSource: BookingRemoteDataSourceImpl(
      dio: ref.watch(dioClientProvider),
    ),
  );
});

final bookingControllerProvider =
    AsyncNotifierProvider<BookingController, List<BookingEntity>>(
      BookingController.new,
    );

// ── Controller ────────────────────────────────────────────────────────────

class BookingController extends AsyncNotifier<List<BookingEntity>>
    with WidgetsBindingObserver {
  /// Set when the last createBooking call failed with TABLE_CONFLICT.
  /// Cleared on the next createBooking attempt.
  String? lastConflictWindow;

  @override
  FutureOr<List<BookingEntity>> build() async {
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() => WidgetsBinding.instance.removeObserver(this));

    final bookings = await _loadBookings();

    // Auto-complete any expired bookings once the first frame is in.
    // addPostFrameCallback avoids mutating `state` during build.
    WidgetsBinding.instance.addPostFrameCallback((_) => _autoCompleteExpired());

    return bookings;
  }

  /// On app resume, finalize any booking whose window has elapsed while the
  /// app was backgrounded. No Timer/polling — driven purely by lifecycle.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _autoCompleteExpired();
  }

  /// Flips bookings past their `endTime` to `completed`. Optimistic local
  /// update first (instant UI — [updateBookingStatus] only reconciles `state`
  /// *after* its server PUT resolves, so without this the UI would lag the
  /// round-trips), then a parallel fire-and-forget server sync. A failed PUT is
  /// swallowed: the local state stays ahead and the next [refresh] corrects it.
  Future<void> _autoCompleteExpired() async {
    final current = state.valueOrNull;
    if (current == null) return;

    final expired = current
        .where(
          (b) =>
              b.isExpired &&
              b.status != 'completed' &&
              b.status != 'cancelled',
        )
        .toList();

    if (expired.isEmpty) return;

    final expiredIds = expired.map((b) => b.id).toSet();

    // Optimistic local update — UI responds instantly.
    state = AsyncData([
      for (final b in current)
        if (expiredIds.contains(b.id)) b.copyWith(status: 'completed') else b,
    ]);

    // Parallel server sync. updateBookingStatus returns Future<bool> and
    // already handles its own failures (returns false), so catchError here is
    // a belt-and-braces guard that must yield a bool to match the type.
    await Future.wait(
      expired.map(
        (b) => updateBookingStatus(b, 'completed').catchError((_) => false),
      ),
    );
  }

  Future<List<BookingEntity>> _loadBookings() async {
    final result = await ref.read(bookingRepositoryProvider).getBookings();
    return result.when(
      success: (list) => list,
      error: (f) => throw f,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadBookings);
  }

  Future<bool> createBooking({
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    String? endTime,
    String? bookingType,
    String? notes,
  }) async {
    lastConflictWindow = null;
    final result = await ref.read(bookingRepositoryProvider).createBooking(
          guestName: guestName,
          phone: phone,
          tableId: tableId,
          date: date,
          timeSlot: timeSlot,
          numberOfGuests: numberOfGuests,
          endTime: endTime,
          bookingType: bookingType,
          notes: notes,
        );
    return result.when(
      success: (entity) {
        final current = state.valueOrNull ?? [];
        state = AsyncData([...current, entity]);
        ref.invalidate(floorControllerProvider);
        return true;
      },
      error: (f) {
        if (f is TableConflictFailure) {
          lastConflictWindow = f.conflictWindow;
        }
        return false;
      },
    );
  }

  Future<bool> updateBooking({
    required String id,
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String status,
    String? endTime,
    String? bookingType,
    String? notes,
  }) async {
    final result = await ref.read(bookingRepositoryProvider).updateBooking(
          id: id,
          guestName: guestName,
          phone: phone,
          tableId: tableId,
          date: date,
          timeSlot: timeSlot,
          numberOfGuests: numberOfGuests,
          status: status,
          endTime: endTime,
          bookingType: bookingType,
          notes: notes,
        );
    return result.when(
      success: (entity) {
        final current = state.valueOrNull ?? [];
        state = AsyncData([
          for (final b in current)
            if (b.id == entity.id) entity else b,
        ]);
        _freeTableIfReleased(entity, tableId);
        return true;
      },
      error: (_) => false,
    );
  }

  /// Mirrors the floor-side release in table_detail_sheet so finalizing a
  /// booking from the Bookings section also clears a manual 'occupied'/
  /// 'guest_arrived' override on the table it was holding.
  ///
  /// Fires when [terminated] has moved into a terminal status
  /// ([kNonBlockingStatuses]) and has a linked table — UNLESS some OTHER
  /// booking still actively holds that table right now
  /// ([BookingEntityX.isHoldingTableAt]). Gating on the *other* holders (not
  /// the terminated booking's own window) is what fixes B5's complete-at/after-
  /// end case while keeping future-cancel protection: a current booking shows
  /// up as an active holder and blocks the free. [sentTableId] (the id sent on
  /// the update) is the fallback when the response omits `tableInfo`.
  ///
  /// Routed through [FloorController.updateTableStatus] (a kept-alive provider)
  /// so a mounted floor reflects the change optimistically; 'free' is
  /// non-sticky after Step 1, so any later booking simply re-derives. Fire-
  /// and-forget: the list update must not block on the floor PUT.
  void _freeTableIfReleased(BookingEntity terminated, String sentTableId) {
    if (!kNonBlockingStatuses.contains(terminated.status)) return;
    final tableId = terminated.tableInfo?.id ?? sentTableId;
    if (tableId.isEmpty) return;

    final bookings = state.valueOrNull ?? const <BookingEntity>[];
    if (_tableHeldByOther(
      tableId: tableId,
      excludeBookingId: terminated.id,
      bookings: bookings,
      now: DateTime.now(),
    )) {
      return;
    }

    unawaited(
      ref
          .read(floorControllerProvider.notifier)
          .updateTableStatus(tableId, 'free'),
    );
  }

  /// Shared "another active holder" gate: true when some booking OTHER than
  /// [excludeBookingId] still actively holds [tableId] at [now]
  /// ([BookingEntityX.isHoldingTableAt]). Used by both the finalize-release
  /// ([_freeTableIfReleased]) and the delete-release
  /// ([_clearOverrideIfReleased]) paths so they can never disagree.
  bool _tableHeldByOther({
    required String tableId,
    required String excludeBookingId,
    required List<BookingEntity> bookings,
    required DateTime now,
  }) {
    return bookings.any(
      (b) =>
          b.id != excludeBookingId &&
          b.tableInfo?.id == tableId &&
          !kNonBlockingStatuses.contains(b.status) &&
          b.isHoldingTableAt(now),
    );
  }

  /// G11: after a booking is deleted, clear a stuck manual override on the
  /// table it was holding. If the linked table still carries a manual
  /// ([kManualStatuses]) status and no OTHER active booking holds it now, reset
  /// it to 'free' so the deleted booking's override doesn't linger. [remaining]
  /// is the post-delete list (the deleted booking already removed); the
  /// "another active holder" gate is shared with [_freeTableIfReleased].
  void _clearOverrideIfReleased(
    BookingEntity deleted,
    List<BookingEntity> remaining,
  ) {
    final tableId = deleted.tableInfo?.id;
    if (tableId == null || tableId.isEmpty) return;

    final table = ref
        .read(floorControllerProvider)
        .valueOrNull
        ?.firstWhereOrNull((t) => t.id == tableId);
    if (table == null || !kManualStatuses.contains(table.status)) return;

    if (_tableHeldByOther(
      tableId: tableId,
      excludeBookingId: deleted.id,
      bookings: remaining,
      now: DateTime.now(),
    )) {
      return;
    }

    unawaited(
      ref
          .read(floorControllerProvider.notifier)
          .updateTableStatus(tableId, 'free'),
    );
  }

  Future<bool> updateBookingStatus(
    BookingEntity booking,
    String newStatus,
  ) => updateBooking(
        id: booking.id,
        guestName: booking.guestName,
        phone: booking.phone,
        tableId: booking.tableInfo?.id ?? '',
        date: booking.date,
        timeSlot: booking.timeSlot,
        numberOfGuests: booking.numberOfGuests,
        status: newStatus,
        endTime: booking.endTime,
        bookingType: booking.bookingType?.name,
        notes: booking.notes,
      );

  Future<bool> deleteBooking({required String id}) async {
    final result =
        await ref.read(bookingRepositoryProvider).deleteBooking(id: id);
    return result.when(
      success: (_) {
        final current = state.valueOrNull ?? [];
        final deleted = current.firstWhereOrNull((b) => b.id == id);
        final remaining = current.where((b) => b.id != id).toList();
        state = AsyncData(remaining);
        if (deleted != null) {
          _clearOverrideIfReleased(deleted, remaining);
        }
        return true;
      },
      error: (_) => false,
    );
  }
}
