import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/features/stats/data/datasources/stats_remote_data_source.dart';
import 'package:mehmon/features/stats/data/repositories/stats_repository_impl.dart';
import 'package:mehmon/features/stats/domain/entities/stats_entity.dart';
import 'package:mehmon/features/stats/domain/repositories/stats_repository.dart';

// ── Providers ─────────────────────────────────────────────────────────────

final statsRemoteDataSourceProvider = Provider<StatsRemoteDataSource>(
  (ref) => DummyStatsRemoteDataSource(),
);

final statsRepositoryProvider = Provider<StatsRepository>(
  (ref) => StatsRepositoryImpl(
    remoteDataSource: ref.watch(statsRemoteDataSourceProvider),
  ),
);

final statsControllerProvider =
    AsyncNotifierProvider<StatsController, StatsEntity>(StatsController.new);

// ── Controller ────────────────────────────────────────────────────────────

class StatsController extends AsyncNotifier<StatsEntity> {
  late final StatsRepository _repo;

  @override
  FutureOr<StatsEntity> build() async {
    _repo = ref.watch(statsRepositoryProvider);
    return _loadStats();
  }

  Future<StatsEntity> _loadStats({String period = 'daily'}) async {
    final result = await _repo.getStats(period: period);
    return result.when(
      success: (stats) => stats,
      error: (f) => throw Exception(f.message),
    );
  }

  Future<void> refresh({String period = 'daily'}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadStats(period: period));
  }
}
