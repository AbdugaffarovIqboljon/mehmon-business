import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/features/stats/data/datasources/stats_remote_data_source.dart';
import 'package:mehmon/features/stats/data/repositories/stats_repository_impl.dart';
import 'package:mehmon/features/stats/domain/entities/stats_entity.dart';
import 'package:mehmon/features/stats/domain/repositories/stats_repository.dart';

// ── Infrastructure ─────────────────────────────────────────────────────────

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return StatsRepositoryImpl(
    dataSource: StatsRemoteDataSourceImpl(
      dio: ref.watch(dioClientProvider),
    ),
  );
});

// ── Summary ────────────────────────────────────────────────────────────────

final summaryControllerProvider =
    AsyncNotifierProvider<SummaryController, AnalyticsSummaryEntity?>(
      SummaryController.new,
    );

class SummaryController extends AsyncNotifier<AnalyticsSummaryEntity?> {
  @override
  FutureOr<AnalyticsSummaryEntity?> build() async {
    final result = await ref.read(statsRepositoryProvider).getSummary();
    return result.when(
      success: (e) => e,
      error: (_) => null,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(statsRepositoryProvider).getSummary();
      return result.when(
        success: (e) => e,
        error: (_) => null,
      );
    });
  }
}

// ── Reports ────────────────────────────────────────────────────────────────

typedef ReportsArg = ({String? startDate, String? endDate});

final reportsControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ReportsController, AnalyticsReportEntity?, ReportsArg>(
      ReportsController.new,
    );

class ReportsController
    extends AutoDisposeFamilyAsyncNotifier<AnalyticsReportEntity?, ReportsArg> {
  @override
  FutureOr<AnalyticsReportEntity?> build(ReportsArg arg) async {
    final result = await ref
        .read(statsRepositoryProvider)
        .getReports(
          startDate: arg.startDate,
          endDate: arg.endDate,
        );
    return result.when(
      success: (e) => e,
      error: (_) => null,
    );
  }
}
