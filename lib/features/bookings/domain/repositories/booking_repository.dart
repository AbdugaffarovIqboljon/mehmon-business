import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';

/// Contract for booking operations.
abstract class BookingRepository {
  Future<Result<List<BookingEntity>>> getBookings();
  Future<Result<BookingEntity>> getBookingById(String id);
  Future<Result<BookingEntity>> createBooking(BookingEntity booking);
  Future<Result<void>> cancelBooking(String id);
}
