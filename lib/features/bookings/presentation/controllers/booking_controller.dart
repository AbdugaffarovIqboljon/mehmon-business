import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/features/bookings/data/datasources/booking_remote_data_source.dart';
import 'package:mehmon/features/bookings/data/repositories/booking_repository_impl.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/domain/repositories/booking_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final bookingRemoteDataSourceProvider = Provider<BookingRemoteDataSource>(
  (ref) => DummyBookingRemoteDataSource(),
);

final bookingRepositoryProvider = Provider<BookingRepository>(
  (ref) => BookingRepositoryImpl(
    remoteDataSource: ref.watch(bookingRemoteDataSourceProvider),
  ),
);

final bookingControllerProvider =
    AsyncNotifierProvider<BookingController, List<BookingEntity>>(
  BookingController.new,
);

// ── Controller ────────────────────────────────────────────────────────────

class BookingController extends AsyncNotifier<List<BookingEntity>> {
  late final BookingRepository _repo;

  @override
  FutureOr<List<BookingEntity>> build() async {
    _repo = ref.watch(bookingRepositoryProvider);
    return _loadBookings();
  }

  Future<List<BookingEntity>> _loadBookings() async {
    final result = await _repo.getBookings();
    return result.when(
      success: (bookings) => bookings,
      error: (f) => throw Exception(f.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadBookings);
  }

  Future<void> create(BookingEntity booking) async {
    final currentBookings = state.valueOrNull ?? const <BookingEntity>[];
    final result = await _repo.createBooking(booking);

    result.when(
      success: (createdBooking) {
        final updatedBookings = [...currentBookings, createdBooking]
          ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
        state = AsyncData(updatedBookings);
      },
      error: (f) {
        state = AsyncError(Exception(f.message), StackTrace.current);
      },
    );
  }

  Future<void> cancel(String id) async {
    final result = await _repo.cancelBooking(id);
    result.when(
      success: (_) => unawaited(Future(refresh)),
      error: (f) {
        state = AsyncError(Exception(f.message), StackTrace.current);
      },
    );
  }
}
