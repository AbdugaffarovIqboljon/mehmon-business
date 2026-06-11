import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/floor/data/datasources/floor_remote_data_source.dart';
import 'package:mehmon/features/floor/data/repositories/floor_repository_impl.dart';
import 'package:mehmon/features/floor/domain/entities/activity_log_entity.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/entities/shift_entity.dart';
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

/// Currently scrubbed time on the floor timeline.
///
/// `null` means live mode — status is DERIVED at the current minute
/// ([liveMinuteProvider]) as `manualOverride ?? auto(now)`, not the raw
/// server status. A non-null value means the user is scrubbing — tables show
/// pure auto-projected status from cached bookings at that time of day.
///
/// `autoDispose` so the scrub time cannot survive a page exit: once no widget
/// on the floor page watches it, it resets to `null` (live). Leaving and
/// re-entering the floor always starts live, never stuck on a stale scrub.
final selectedTimelineProvider =
    StateProvider.autoDispose<TimeOfDay?>((ref) => null);

/// Current wall-clock minute-of-day used as the live reference time.
///
/// In live mode ([selectedTimelineProvider] is `null`) the floor page advances
/// this on the same 60s tick that drives the clock display, so the canvas
/// recomputes table status on the minute boundary (reserved → waiting → free)
/// with no user interaction. Ignored while scrubbing, where the scrubbed
/// [TimeOfDay] is the reference instead. This is the SAME "now" source feeding
/// both the clock and live status — keep them in lockstep.
final liveMinuteProvider = StateProvider<int>((ref) {
  final now = DateTime.now();
  return now.hour * 60 + now.minute;
});

/// Floor edit mode toggle. When `true`, drag changes and rotations buffer
/// into [pendingPositionsProvider] / [pendingRotationsProvider] instead of
/// auto-saving, and tapping a table reveals rotation controls instead of
/// opening the detail sheet.
final floorEditModeProvider = StateProvider<bool>((ref) => false);

/// Currently selected zone filter on the floor page.
///
/// `null` means "Barchasi" (show every zone). Filtering is performed
/// client-side over the already-fetched tables — the tables API is never
/// re-queried per zone.
final selectedZoneProvider = StateProvider<String?>((ref) => null);

/// Per-table in-flight position changes awaiting "Saqlash" in edit mode.
final pendingPositionsProvider =
    StateProvider<Map<String, Offset>>((ref) => {});

/// Per-table in-flight rotation changes awaiting "Saqlash" in edit mode.
final pendingRotationsProvider =
    StateProvider<Map<String, double>>((ref) => {});

final activityLogControllerProvider =
    AsyncNotifierProvider<ActivityLogController, List<ActivityLogEntity>>(
      ActivityLogController.new,
    );

final shiftsControllerProvider =
    AsyncNotifierProvider<ShiftsController, List<ShiftEntity>>(
      ShiftsController.new,
    );

// ── Controller ────────────────────────────────────────────────────────────

class FloorController extends AsyncNotifier<List<FloorEntity>> {
  @override
  FutureOr<List<FloorEntity>> build() async {
    final repo = ref.watch(floorRepositoryProvider);

    final timer = Timer.periodic(
      const Duration(seconds: 30),
      (_) {
        if (state.isLoading) return;
        if (ref.read(selectedTimelineProvider) != null) return;
        ref
          ..invalidateSelf()
          ..invalidate(bookingControllerProvider);
      },
    );
    ref.onDispose(timer.cancel);

    return _fetchFloors(repo);
  }

  Future<List<FloorEntity>> _fetchFloors(FloorRepository repo) async {
    final result = await repo.getTables();
    return result.when(
      success: (floors) => floors,
      error: (f) => throw f,
    );
  }

  Future<void> refresh() async {
    final repo = ref.read(floorRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchFloors(repo));
  }

  // Canvas-space center used as spawn when the floor is empty. Mirrors the
  // canvas's 4000×4000 surface (kCanvasWidth/kCanvasHeight in floor_map_canvas).
  static const Offset _kDefaultSpawn = Offset(2000, 2000);

  Future<bool> createTable({
    required String number,
    required int capacity,
    required String location,
  }) async {
    final snapshot = state.valueOrNull ?? const <FloorEntity>[];
    final spawn = _spawnPositionFor(snapshot);
    final result = await ref.read(floorRepositoryProvider).createTable(
          number: number,
          capacity: capacity,
          location: location,
          x: spawn.dx,
          y: spawn.dy,
        );
    return result.when(
      success: (entity) {
        final latest = state.valueOrNull ?? snapshot;
        if (latest.any((t) => t.id == entity.id)) {
          state = AsyncData(latest);
        } else {
          state = AsyncData([...latest, entity]);
        }
        return true;
      },
      error: (_) => false,
    );
  }

  Offset _spawnPositionFor(List<FloorEntity> tables) {
    if (tables.isEmpty) return _kDefaultSpawn;
    var sumX = 0.0;
    var sumY = 0.0;
    for (final t in tables) {
      sumX += t.x;
      sumY += t.y;
    }
    final n = tables.length;
    final cx = sumX / n;
    final cy = sumY / n;
    final spawn = Offset(cx + 40, cy + 40);
    if (!spawn.dx.isFinite || !spawn.dy.isFinite) return _kDefaultSpawn;
    return spawn;
  }

  Future<bool> updateTable({
    required String id,
    required String number,
    required int capacity,
    required String location,
  }) async {
    final result = await ref.read(floorRepositoryProvider).updateTable(
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
    final result = await ref.read(floorRepositoryProvider).deleteTable(id: id);
    return result.when(
      success: (_) {
        final current = state.valueOrNull ?? [];
        state = AsyncData(current.where((t) => t.id != id).toList());
        return true;
      },
      error: (_) => false,
    );
  }

  /// Optimistically updates table position (and optionally rotation)
  /// locally, then persists to backend. Position/rotation are cosmetic —
  /// backend errors are swallowed so the user's arrangement isn't lost
  /// when the network blips.
  Future<void> updateTablePosition(
    String tableId,
    double x,
    double y, {
    double? rotation,
  }) async {
    state = state.whenData(
      (tables) => [
        for (final t in tables)
          if (t.id == tableId)
            t.copyWith(
              x: x,
              y: y,
              rotation: rotation ?? t.rotation,
            )
          else
            t,
      ],
    );
    await ref.read(floorRepositoryProvider).updateTablePosition(
          tableId,
          x,
          y,
          rotation: rotation,
        );
  }

  /// Optimistically updates table status locally, then persists to backend.
  /// Reverts the optimistic patch on API error so state stays consistent.
  Future<void> updateTableStatus(String id, String status) async {
    final previous = state.valueOrNull ?? [];
    state = state.whenData(
      (tables) => [
        for (final t in tables)
          if (t.id == id) t.copyWith(status: status) else t,
      ],
    );
    final result = await ref
        .read(floorRepositoryProvider)
        .updateTableStatus(id, status);
    result.when(
      success: (_) {},
      error: (_) => state = AsyncData(previous),
    );
  }

  /// Optimistically applies a rotation update locally without hitting the
  /// API. Used while the user is fiddling with rotation controls in edit
  /// mode; the actual PUT is bundled with x/y on "Saqlash".
  Future<void> updateTableRotation(String tableId, double rotation) async {
    state = state.whenData(
      (tables) => [
        for (final t in tables)
          if (t.id == tableId) t.copyWith(rotation: rotation) else t,
      ],
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
      error: (f) => throw f,
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
      error: (f) => throw f,
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
    List<String>? assignedTables,
  }) async {
    try {
      final result = await _repo.createShift(
        staffName: staffName,
        startTime: startTime,
        endTime: endTime,
        date: date,
        notes: notes,
        assignedTables: assignedTables,
      );
      return result.when(
        success: (entity) {
          final current = state.valueOrNull ?? [];
          state = AsyncData([entity, ...current]);
          return true;
        },
        error: (_) => false,
      );
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> editShift(
    String id, {
    String? staffName,
    String? startTime,
    String? endTime,
    String? date,
    String? notes,
    List<String>? assignedTables,
  }) async {
    try {
      final result = await _repo.editShift(
        id,
        staffName: staffName,
        startTime: startTime,
        endTime: endTime,
        date: date,
        notes: notes,
        assignedTables: assignedTables,
      );
      return result.when(
        success: (updated) {
          final current = state.valueOrNull ?? [];
          state = AsyncData([
            for (final s in current)
              if (s.id == updated.id) updated else s,
          ]);
          return true;
        },
        error: (_) => false,
      );
    } on Exception catch (_) {
      return false;
    }
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
