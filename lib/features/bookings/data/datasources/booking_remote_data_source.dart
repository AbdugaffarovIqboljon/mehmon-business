import 'package:mehmon/features/bookings/data/models/booking_model.dart';

/// Remote data source contract for booking operations.
abstract class BookingRemoteDataSource {
  Future<List<BookingModel>> getBookings();
  Future<BookingModel> getBookingById(String id);
  Future<BookingModel> createBooking(BookingModel booking);
  Future<void> cancelBooking(String id);
}

/// Dummy implementation returning mock data.
class DummyBookingRemoteDataSource implements BookingRemoteDataSource {
  @override
  Future<List<BookingModel>> getBookings() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [
      BookingModel(
        id: 'bk_01',
        guestName: 'John Doe',
        dateTime: DateTime.now().add(const Duration(hours: 2)),
        partySize: 4,
        status: 'confirmed',
      ),
      BookingModel(
        id: 'bk_02',
        guestName: 'Jane Smith',
        dateTime: DateTime.now().add(const Duration(hours: 5)),
        notes: 'Window table preferred',
      ),
      BookingModel(
        id: 'bk_03',
        guestName: 'Bob Wilson',
        dateTime: DateTime.now().add(const Duration(days: 1)),
        partySize: 6,
        status: 'confirmed',
        tableId: 'tbl_05',
      ),
    ];
  }

  @override
  Future<BookingModel> getBookingById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return BookingModel(
      id: id,
      guestName: 'John Doe',
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      partySize: 4,
      status: 'confirmed',
    );
  }

  @override
  Future<BookingModel> createBooking(BookingModel booking) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return booking;
  }

  @override
  Future<void> cancelBooking(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
}
