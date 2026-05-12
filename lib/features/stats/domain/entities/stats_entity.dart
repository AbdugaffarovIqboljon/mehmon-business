import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';

export 'package:mehmon/features/bookings/domain/entities/booking_entity.dart'
    show TableInfoEntity;

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
abstract class ReportBookingEntity with _$ReportBookingEntity {
  const factory ReportBookingEntity({
    required String id,
    required String bookingType,
    required String guestName,
    required String phone,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String status,
    required String createdAt,
    TableInfoEntity? tableId,
    String? endTime,
    String? notes,
  }) = _ReportBookingEntity;
}

@freezed
abstract class AnalyticsReportEntity with _$AnalyticsReportEntity {
  const factory AnalyticsReportEntity({
    required AnalyticsPeriodEntity period,
    required int totalBookings,
    required int completed,
    required int cancelled,
    required int totalGuests,
    @Default([]) List<ReportBookingEntity> bookings,
  }) = _AnalyticsReportEntity;
}
