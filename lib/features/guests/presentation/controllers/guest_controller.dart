import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/features/guests/data/datasources/guest_remote_data_source.dart';
import 'package:mehmon/features/guests/data/repositories/guest_repository_impl.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/domain/repositories/guest_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final guestRemoteDataSourceProvider = Provider<GuestRemoteDataSource>(
  (ref) => DummyGuestRemoteDataSource(),
);

final guestRepositoryProvider = Provider<GuestRepository>(
  (ref) => GuestRepositoryImpl(
    remoteDataSource: ref.watch(guestRemoteDataSourceProvider),
  ),
);

final guestControllerProvider =
    AsyncNotifierProvider<GuestController, List<GuestEntity>>(
      GuestController.new,
    );

enum GuestFilterTab { allGuests, inHall }

final guestFilterTabProvider = StateProvider<GuestFilterTab>(
  (ref) => GuestFilterTab.allGuests,
);

final filteredGuestsProvider = Provider<List<GuestEntity>>((ref) {
  final guests = ref.watch(guestControllerProvider).asData?.value ?? [];
  final filter = ref.watch(guestFilterTabProvider);

  if (filter == GuestFilterTab.inHall) {
    return guests.where((guest) => guest.isInHall).toList();
  }

  return guests;
});

final guestByIdProvider = Provider.family<GuestEntity?, String>((ref, guestId) {
  final guests = ref.watch(guestControllerProvider).asData?.value;
  if (guests == null) return null;
  for (final guest in guests) {
    if (guest.id == guestId) return guest;
  }
  return null;
});

// ── Controller ────────────────────────────────────────────────────────────

class GuestController extends AsyncNotifier<List<GuestEntity>> {
  late final GuestRepository _repo;

  @override
  FutureOr<List<GuestEntity>> build() async {
    _repo = ref.watch(guestRepositoryProvider);
    return _loadGuests();
  }

  Future<List<GuestEntity>> _loadGuests() async {
    final result = await _repo.getGuests();
    return result.when(
      success: (guests) => guests,
      error: (f) => throw Exception(f.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadGuests);
  }
}
