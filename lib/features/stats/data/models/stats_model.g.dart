// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsPeriodModelImpl _$$AnalyticsPeriodModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticsPeriodModelImpl(
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
);

Map<String, dynamic> _$$AnalyticsPeriodModelImplToJson(
  _$AnalyticsPeriodModelImpl instance,
) => <String, dynamic>{
  'start_date': instance.startDate,
  'end_date': instance.endDate,
};

_$AnalyticsSummaryModelImpl _$$AnalyticsSummaryModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticsSummaryModelImpl(
  totalBookings: (json['total_bookings'] as num).toInt(),
  confirmedBookings: (json['confirmed_bookings'] as num).toInt(),
  pendingBookings: (json['pending_bookings'] as num).toInt(),
  totalGuests: (json['total_guests'] as num).toInt(),
  totalTables: (json['total_tables'] as num).toInt(),
  occupancyRate: (json['occupancy_rate'] as num).toDouble(),
);

Map<String, dynamic> _$$AnalyticsSummaryModelImplToJson(
  _$AnalyticsSummaryModelImpl instance,
) => <String, dynamic>{
  'total_bookings': instance.totalBookings,
  'confirmed_bookings': instance.confirmedBookings,
  'pending_bookings': instance.pendingBookings,
  'total_guests': instance.totalGuests,
  'total_tables': instance.totalTables,
  'occupancy_rate': instance.occupancyRate,
};

_$AnalyticsReportModelImpl _$$AnalyticsReportModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticsReportModelImpl(
  period: AnalyticsPeriodModel.fromJson(json['period'] as Map<String, dynamic>),
  totalBookings: (json['total_bookings'] as num).toInt(),
  completed: (json['completed'] as num).toInt(),
  cancelled: (json['cancelled'] as num).toInt(),
  totalGuests: (json['total_guests'] as num).toInt(),
  bookings: json['bookings'] as List<dynamic>? ?? const [],
);

Map<String, dynamic> _$$AnalyticsReportModelImplToJson(
  _$AnalyticsReportModelImpl instance,
) => <String, dynamic>{
  'period': instance.period,
  'total_bookings': instance.totalBookings,
  'completed': instance.completed,
  'cancelled': instance.cancelled,
  'total_guests': instance.totalGuests,
  'bookings': instance.bookings,
};
