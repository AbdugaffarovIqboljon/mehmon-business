import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/features/bookings/data/datasources/booking_remote_data_source.dart';
import 'package:mehmon/features/bookings/data/repositories/booking_repository_impl.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/domain/repositories/booking_repository.dart';
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

class BookingController extends AsyncNotifier<List<BookingEntity>> {
  @override
  FutureOr<List<BookingEntity>> build() => _loadBookings();

  Future<List<BookingEntity>> _loadBookings() async {
    final result = await ref.read(bookingRepositoryProvider).getBookings();
    return result.when(
      success: (list) => list,
      error: (f) => throw Exception(f.message),
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
        ref
          ..invalidate(floorControllerProvider)
          ..invalidate(tableDetailsProvider);
        return true;
      },
      error: (_) => false,
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
        ref.invalidate(tableDetailsProvider);
        return true;
      },
      error: (_) => false,
    );
  }

  Future<bool> deleteBooking({required String id}) async {
    final result =
        await ref.read(bookingRepositoryProvider).deleteBooking(id: id);
    return result.when(
      success: (_) {
        final current = state.valueOrNull ?? [];
        state = AsyncData(current.where((b) => b.id != id).toList());
        ref.invalidate(tableDetailsProvider);
        return true;
      },
      error: (_) => false,
    );
  }
}
