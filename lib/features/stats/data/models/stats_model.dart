import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_model.freezed.dart';
part 'stats_model.g.dart';

@freezed
abstract class AnalyticsPeriodModel with _$AnalyticsPeriodModel {
  const factory AnalyticsPeriodModel({
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
  }) = _AnalyticsPeriodModel;

  factory AnalyticsPeriodModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsPeriodModelFromJson(json);
}

@freezed
abstract class AnalyticsSummaryModel with _$AnalyticsSummaryModel {
  const factory AnalyticsSummaryModel({
    @JsonKey(name: 'total_bookings') required int totalBookings,
    @JsonKey(name: 'confirmed_bookings') required int confirmedBookings,
    @JsonKey(name: 'pending_bookings') required int pendingBookings,
    @JsonKey(name: 'total_guests') required int totalGuests,
    @JsonKey(name: 'total_tables') required int totalTables,
    @JsonKey(name: 'occupancy_rate') required double occupancyRate,
  }) = _AnalyticsSummaryModel;

  factory AnalyticsSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsSummaryModelFromJson(json);
}

@freezed
abstract class AnalyticsReportModel with _$AnalyticsReportModel {
  const factory AnalyticsReportModel({
    required AnalyticsPeriodModel period,
    @JsonKey(name: 'total_bookings') required int totalBookings,
    required int completed,
    required int cancelled,
    @JsonKey(name: 'total_guests') required int totalGuests,
    @Default([]) List<dynamic> bookings,
  }) = _AnalyticsReportModel;

  factory AnalyticsReportModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsReportModelFromJson(json);
}
