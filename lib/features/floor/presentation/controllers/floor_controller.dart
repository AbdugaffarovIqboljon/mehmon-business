import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/features/floor/data/datasources/floor_remote_data_source.dart';
import 'package:mehmon/features/floor/data/repositories/floor_repository_impl.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/repositories/floor_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final floorRemoteDataSourceProvider = Provider<FloorRemoteDataSource>(
  (ref) => DummyFloorRemoteDataSource(),
);

final floorRepositoryProvider = Provider<FloorRepository>(
  (ref) => FloorRepositoryImpl(
    remoteDataSource: ref.watch(floorRemoteDataSourceProvider),
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
    final result = await _repo.getFloors();
    return result.when(
      success: (floors) => floors,
      error: (f) => throw Exception(f.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadFloors);
  }
}
