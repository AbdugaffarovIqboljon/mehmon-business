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
        name: 'Mina Cooper',
        avatarUrl: 'https://i.pravatar.cc/300?img=47',
        phone: '+998 90 123 45 67',
        tableLabel: 'No.54',
        visitDate: '12.12.25',
        guestCount: 2,
        visitCount: 12,
        notes:
            'Любит столик у окна, аллергия на орехи, предпочитает тихую зону.',
        isVip: true,
        isInHall: true,
        visitHistory: [
          GuestVisitModel(date: '12.12.25', tableLabel: 'No.54', guestCount: 2),
          GuestVisitModel(date: '10.12.25', tableLabel: 'No.54', guestCount: 2),
          GuestVisitModel(date: '01.12.25', tableLabel: 'No.54', guestCount: 2),
        ],
      ),
      GuestModel(
        id: 'gst_02',
        name: 'Sardor Tashpulatov',
        avatarUrl: 'https://i.pravatar.cc/300?img=13',
        email: 'sardor@example.com',
        tableLabel: 'No.21',
        visitDate: '11.12.25',
        guestCount: 4,
        visitCount: 3,
        notes: 'Предпочитает бизнес-ланч и быструю подачу.',
        isInHall: true,
        visitHistory: [
          GuestVisitModel(date: '11.12.25', tableLabel: 'No.21', guestCount: 4),
          GuestVisitModel(date: '05.12.25', tableLabel: 'No.18', guestCount: 3),
        ],
      ),
      GuestModel(
        id: 'gst_03',
        name: 'Nodira Qodirova',
        phone: '+998 93 777 88 99',
        tableLabel: 'No.12',
        visitDate: '09.12.25',
        guestCount: 2,
        visitCount: 7,
        notes: 'Всегда просит детское меню и стул для ребенка.',
        visitHistory: [
          GuestVisitModel(date: '09.12.25', tableLabel: 'No.12', guestCount: 2),
          GuestVisitModel(date: '02.12.25', tableLabel: 'No.09', guestCount: 3),
        ],
      ),
      GuestModel(
        id: 'gst_04',
        name: 'Dilshod Karimov',
        email: 'd.karimov@example.com',
        tableLabel: 'No.08',
        visitDate: '08.12.25',
        visitCount: 2,
        notes: 'Просит безглютеновые блюда.',
        visitHistory: [GuestVisitModel(date: '08.12.25', tableLabel: 'No.08')],
      ),
    ];
  }

  @override
  Future<GuestModel> getGuestById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final guests = await getGuests();
    return guests.firstWhere((guest) => guest.id == id);
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
