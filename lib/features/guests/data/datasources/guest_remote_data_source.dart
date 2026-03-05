import 'package:mehmon/features/guests/data/models/guest_model.dart';

/// Remote data source contract for guest operations.
abstract class GuestRemoteDataSource {
  Future<List<GuestModel>> getGuests();
  Future<GuestModel> getGuestById(String id);
  Future<GuestModel> createGuest(GuestModel guest);
  Future<GuestModel> updateGuest(GuestModel guest);
}

/// Dummy implementation returning mock data.
class DummyGuestRemoteDataSource implements GuestRemoteDataSource {
  @override
  Future<List<GuestModel>> getGuests() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const [
      GuestModel(
        id: 'gst_01',
        name: 'Alice Johnson',
        phone: '+1 555-0101',
        email: 'alice@example.com',
        visitCount: 12,
        isVip: true,
      ),
      GuestModel(
        id: 'gst_02',
        name: 'Bob Williams',
        phone: '+1 555-0102',
        visitCount: 3,
      ),
      GuestModel(
        id: 'gst_03',
        name: 'Carol Davis',
        email: 'carol@example.com',
        visitCount: 7,
        notes: 'Allergic to peanuts',
      ),
    ];
  }

  @override
  Future<GuestModel> getGuestById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return const GuestModel(
      id: 'gst_01',
      name: 'Alice Johnson',
      phone: '+1 555-0101',
      email: 'alice@example.com',
      visitCount: 12,
      isVip: true,
    );
  }

  @override
  Future<GuestModel> createGuest(GuestModel guest) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return guest;
  }

  @override
  Future<GuestModel> updateGuest(GuestModel guest) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return guest;
  }
}
