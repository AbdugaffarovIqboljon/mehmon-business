import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';

abstract class BookingRepository {
  Future<Result<List<BookingEntity>>> getBookings();

  Future<Result<BookingEntity>> createBooking({
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    String? notes,
  });

  Future<Result<BookingEntity>> updateBooking({
    required String id,
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String status,
    String? notes,
  });

  Future<Result<String>> deleteBooking({required String id});
}
