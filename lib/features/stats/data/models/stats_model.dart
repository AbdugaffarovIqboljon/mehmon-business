import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/stats/domain/entities/stats_entity.dart';

part 'stats_model.freezed.dart';
part 'stats_model.g.dart';

@freezed
abstract class AnalyticsPeriodModel with _$AnalyticsPeriodModel {
  const factory AnalyticsPeriodModel({
    required String startDate,
    required String endDate,
  }) = _AnalyticsPeriodModel;

  factory AnalyticsPeriodModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsPeriodModelFromJson(json);
}

@freezed
abstract class AnalyticsSummaryModel with _$AnalyticsSummaryModel {
  const factory AnalyticsSummaryModel({
    required int totalBookings,
    required int confirmedBookings,
    required int pendingBookings,
    required int totalGuests,
    required int totalTables,
    required double occupancyRate,
  }) = _AnalyticsSummaryModel;

  factory AnalyticsSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsSummaryModelFromJson(json);
}

@freezed
abstract class AnalyticsReportModel with _$AnalyticsReportModel {
  const factory AnalyticsReportModel({
    required AnalyticsPeriodModel period,
    required int totalBookings,
    required int completed,
    required int cancelled,
    required int totalGuests,
    @Default([]) List<ReportBookingModel> bookings,
  }) = _AnalyticsReportModel;

  factory AnalyticsReportModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsReportModelFromJson(json);
}

@freezed
abstract class ReportBookingModel with _$ReportBookingModel {
  const ReportBookingModel._();

  // Freezed requires the private `._()` constructor before the unnamed factory
  // to enable custom methods (toEntity). This conflicts with sort_unnamed_constructors_first.
  // ignore: sort_unnamed_constructors_first
  const factory ReportBookingModel({
    @JsonKey(name: '_id') required String id,
    required String bookingType,
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String status,
    required String createdAt,
    String? endTime,
    String? notes,
  }) = _ReportBookingModel;

  factory ReportBookingModel.fromJson(Map<String, dynamic> json) =>
      _$ReportBookingModelFromJson(json);

  ReportBookingEntity toEntity() => ReportBookingEntity(
    id: id,
    bookingType: bookingType,
    guestName: guestName,
    phone: phone,
    tableId: tableId,
    date: date,
    timeSlot: timeSlot,
    numberOfGuests: numberOfGuests,
    status: status,
    createdAt: createdAt,
    endTime: endTime,
    notes: notes,
  );
}
