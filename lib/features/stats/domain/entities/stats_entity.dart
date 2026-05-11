import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_entity.freezed.dart';

@freezed
abstract class AnalyticsPeriodEntity with _$AnalyticsPeriodEntity {
  const factory AnalyticsPeriodEntity({
    required String startDate,
    required String endDate,
  }) = _AnalyticsPeriodEntity;
}

@freezed
abstract class AnalyticsSummaryEntity with _$AnalyticsSummaryEntity {
  const factory AnalyticsSummaryEntity({
    required int totalBookings,
    required int confirmedBookings,
    required int pendingBookings,
    required int totalGuests,
    required int totalTables,
    required double occupancyRate,
  }) = _AnalyticsSummaryEntity;
}

@freezed
abstract class AnalyticsReportEntity with _$AnalyticsReportEntity {
  const factory AnalyticsReportEntity({
    required AnalyticsPeriodEntity period,
    required int totalBookings,
    required int completed,
    required int cancelled,
    required int totalGuests,
  }) = _AnalyticsReportEntity;
}
