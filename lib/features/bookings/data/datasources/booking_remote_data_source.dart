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
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return [
      BookingModel(
        id: 'bk_01',
        guestName: 'Алишер Ибрагимов',
        dateTime: today.add(const Duration(hours: 10)),
        partySize: 6,
        status: 'confirmed',
        notes: 'День рождения, нужен длинный стол',
      ),
      BookingModel(
        id: 'bk_02',
        guestName: 'Гульноза Каримова',
        dateTime: today.add(const Duration(hours: 14)),
        notes: 'Без острых блюд',
      ),
      BookingModel(
        id: 'bk_03',
        guestName: 'Фаррух Нуруллаев',
        dateTime: today.add(const Duration(hours: 19)),
        partySize: 3,
        status: 'new',
      ),
      BookingModel(
        id: 'bk_04',
        guestName: 'Дилдора Сатторова',
        dateTime: today.add(const Duration(days: 1, hours: 13)),
        partySize: 4,
        status: 'confirmed',
        tableId: 'tbl_05',
      ),
      BookingModel(
        id: 'bk_05',
        guestName: 'Исломбек Рахимов',
        dateTime: today.add(const Duration(days: 2, hours: 20)),
      ),
      BookingModel(
        id: 'bk_06',
        guestName: 'Мехрибон Абдуллаева',
        dateTime: today.subtract(const Duration(days: 1)).add(
              const Duration(hours: 12),
            ),
        partySize: 5,
        status: 'confirmed',
      ),
      BookingModel(
        id: 'bk_07',
        guestName: 'Сардор Мусаев',
        dateTime: today.add(const Duration(days: 4, hours: 18)),
        partySize: 7,
        status: 'new',
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
