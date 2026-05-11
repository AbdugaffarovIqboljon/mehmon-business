import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/stats/domain/entities/stats_entity.dart';

abstract class StatsRepository {
  Future<Result<AnalyticsSummaryEntity>> getSummary();

  Future<Result<AnalyticsReportEntity>> getReports({
    String? startDate,
    String? endDate,
  });
}
