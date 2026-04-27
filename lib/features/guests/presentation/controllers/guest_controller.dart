import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/features/guests/data/datasources/guest_remote_data_source.dart';
import 'package:mehmon/features/guests/data/repositories/guest_repository_impl.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/domain/repositories/guest_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final guestRepositoryProvider = Provider<GuestRepository>((ref) {
  return GuestRepositoryImpl(
    dataSource: GuestRemoteDataSourceImpl(
      dio: ref.watch(dioClientProvider),
    ),
  );
});

final guestControllerProvider =
    AsyncNotifierProvider<GuestController, List<GuestEntity>>(
      GuestController.new,
    );

final guestDetailProvider = AsyncNotifierProvider.autoDispose
    .family<GuestDetailNotifier, GuestEntity, String>(
      GuestDetailNotifier.new,
    );

enum GuestFilterTab { allGuests, inHall }

final guestFilterTabProvider = StateProvider<GuestFilterTab>(
  (ref) => GuestFilterTab.allGuests,
);

final filteredGuestsProvider = Provider<List<GuestEntity>>((ref) {
  final guests = ref.watch(guestControllerProvider).asData?.value ?? [];
  final filter = ref.watch(guestFilterTabProvider);

  if (filter == GuestFilterTab.inHall) {
    return guests;
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

// ── List Controller ───────────────────────────────────────────────────────

class GuestController extends AsyncNotifier<List<GuestEntity>> {
  @override
  FutureOr<List<GuestEntity>> build() => _loadGuests();

  Future<List<GuestEntity>> _loadGuests() async {
    final result = await ref.read(guestRepositoryProvider).getGuests();
    return result.when(
      success: (list) => list,
      error: (f) => throw Exception(f.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadGuests);
  }

  Future<bool> createGuest({
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  }) async {
    final result = await ref
        .read(guestRepositoryProvider)
        .createGuest(name: name, phone: phone, email: email, notes: notes, avatarUrl: avatarUrl);
    return result.when(
      success: (entity) {
        final current = state.valueOrNull ?? [];
        state = AsyncData([...current, entity]);
        return true;
      },
      error: (_) => false,
    );
  }

  Future<bool> updateGuest({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? notes,
  }) async {
    final result = await ref
        .read(guestRepositoryProvider)
        .updateGuest(id: id, name: name, phone: phone, email: email, notes: notes);
    return result.when(
      success: (entity) {
        final current = state.valueOrNull ?? [];
        state = AsyncData([
          for (final g in current)
            if (g.id == entity.id) entity else g,
        ]);
        return true;
      },
      error: (_) => false,
    );
  }

  Future<bool> deleteGuest({required String id}) async {
    final result =
        await ref.read(guestRepositoryProvider).deleteGuest(id: id);
    return result.when(
      success: (_) {
        final current = state.valueOrNull ?? [];
        state = AsyncData(current.where((g) => g.id != id).toList());
        return true;
      },
      error: (_) => false,
    );
  }
}

// ── Detail Notifier ───────────────────────────────────────────────────────

class GuestDetailNotifier
    extends AutoDisposeFamilyAsyncNotifier<GuestEntity, String> {
  @override
  Future<GuestEntity> build(String id) async {
    final result =
        await ref.read(guestRepositoryProvider).getGuestById(id: id);
    return result.when(
      success: (entity) => entity,
      error: (f) => throw Exception(f.message),
    );
  }
}
