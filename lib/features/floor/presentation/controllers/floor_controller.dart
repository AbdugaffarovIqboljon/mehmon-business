import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/features/floor/data/datasources/floor_remote_data_source.dart';
import 'package:mehmon/features/floor/data/repositories/floor_repository_impl.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/repositories/floor_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final floorRemoteDataSourceProvider = Provider<FloorRemoteDataSource>(
  (ref) => FloorRemoteDataSourceImpl(dio: ref.watch(dioClientProvider)),
);

final floorRepositoryProvider = Provider<FloorRepository>(
  (ref) => FloorRepositoryImpl(
    dataSource: ref.watch(floorRemoteDataSourceProvider),
  ),
);

final floorControllerProvider =
    AsyncNotifierProvider<FloorController, List<FloorEntity>>(
      FloorController.new,
    );

// ── Controller ────────────────────────────────────────────────────────────

class FloorController extends AsyncNotifier<List<FloorEntity>> {
  late final FloorRepository _repo;

  @override
  FutureOr<List<FloorEntity>> build() async {
    _repo = ref.watch(floorRepositoryProvider);
    return _loadFloors();
  }

  Future<List<FloorEntity>> _loadFloors() async {
    final result = await _repo.getTables();
    return result.when(
      success: (floors) => floors,
      error: (f) => throw Exception(f.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadFloors);
  }

  Future<bool> createTable({
    required String number,
    required int capacity,
    required String location,
  }) async {
    final result = await _repo.createTable(
      number: number,
      capacity: capacity,
      location: location,
    );
    return result.when(
      success: (entity) {
        final current = state.valueOrNull ?? [];
        state = AsyncData([...current, entity]);
        return true;
      },
      error: (_) => false,
    );
  }

  Future<bool> updateTable({
    required String id,
    required String number,
    required int capacity,
    required String location,
  }) async {
    final result = await _repo.updateTable(
      id: id,
      number: number,
      capacity: capacity,
      location: location,
    );
    return result.when(
      success: (entity) {
        final current = state.valueOrNull ?? [];
        state = AsyncData([
          for (final t in current)
            if (t.id == entity.id) entity else t,
        ]);
        return true;
      },
      error: (_) => false,
    );
  }

  Future<bool> deleteTable({required String id}) async {
    final result = await _repo.deleteTable(id: id);
    return result.when(
      success: (_) {
        final current = state.valueOrNull ?? [];
        state = AsyncData(current.where((t) => t.id != id).toList());
        return true;
      },
      error: (_) => false,
    );
  }
}
