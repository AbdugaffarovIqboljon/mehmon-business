import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/features/floor/data/datasources/floor_remote_data_source.dart';
import 'package:mehmon/features/floor/data/repositories/floor_repository_impl.dart';
import 'package:mehmon/features/floor/domain/entities/activity_log_entity.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/entities/shift_entity.dart';
import 'package:mehmon/features/floor/domain/entities/table_details_entity.dart';
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

final activityLogControllerProvider =
    AsyncNotifierProvider<ActivityLogController, List<ActivityLogEntity>>(
      ActivityLogController.new,
    );

final shiftsControllerProvider =
    AsyncNotifierProvider<ShiftsController, List<ShiftEntity>>(
      ShiftsController.new,
    );

final tableDetailsProvider = FutureProvider.autoDispose
    .family<TableDetailsEntity, String>((ref, tableId) async {
  final repo = ref.read(floorRepositoryProvider);
  final result = await repo.getTableDetails(tableId);
  return result.when(
    success: (details) => details,
    error: (f) => throw Exception(f.message),
  );
});

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

// ── ActivityLog Controller ────────────────────────────────────────────────

class ActivityLogController extends AsyncNotifier<List<ActivityLogEntity>> {
  late final FloorRepository _repo;

  @override
  FutureOr<List<ActivityLogEntity>> build() async {
    _repo = ref.watch(floorRepositoryProvider);
    return _load();
  }

  Future<List<ActivityLogEntity>> _load() async {
    final result = await _repo.getActivityLog();
    return result.when(
      success: (logs) => logs,
      error: (f) => throw Exception(f.message),
    );
  }

  Future<void> fetchActivityLog() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }
}

// ── Shifts Controller ─────────────────────────────────────────────────────

class ShiftsController extends AsyncNotifier<List<ShiftEntity>> {
  late final FloorRepository _repo;

  @override
  FutureOr<List<ShiftEntity>> build() async {
    _repo = ref.watch(floorRepositoryProvider);
    return _load();
  }

  Future<List<ShiftEntity>> _load() async {
    final result = await _repo.getShifts();
    return result.when(
      success: (shifts) => shifts,
      error: (f) => throw Exception(f.message),
    );
  }

  Future<void> fetchShifts() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }

  Future<bool> addShift({
    required String staffName,
    required String startTime,
    required String endTime,
    required String date,
    String? notes,
  }) async {
    final result = await _repo.createShift(
      staffName: staffName,
      startTime: startTime,
      endTime: endTime,
      date: date,
      notes: notes,
    );
    return result.when(
      success: (entity) {
        final current = state.valueOrNull ?? [];
        state = AsyncData([entity, ...current]);
        return true;
      },
      error: (_) => false,
    );
  }

  Future<bool> removeShift(String id) async {
    final previous = state.valueOrNull ?? [];
    state = AsyncData(previous.where((s) => s.id != id).toList());
    final result = await _repo.deleteShift(id);
    return result.when(
      success: (_) => true,
      error: (_) {
        state = AsyncData(previous);
        return false;
      },
    );
  }
}
