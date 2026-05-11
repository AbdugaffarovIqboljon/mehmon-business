// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsPeriodModelImpl _$$AnalyticsPeriodModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticsPeriodModelImpl(
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String,
);

Map<String, dynamic> _$$AnalyticsPeriodModelImplToJson(
  _$AnalyticsPeriodModelImpl instance,
) => <String, dynamic>{
  'startDate': instance.startDate,
  'endDate': instance.endDate,
};

_$AnalyticsSummaryModelImpl _$$AnalyticsSummaryModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticsSummaryModelImpl(
  totalBookings: (json['totalBookings'] as num).toInt(),
  confirmedBookings: (json['confirmedBookings'] as num).toInt(),
  pendingBookings: (json['pendingBookings'] as num).toInt(),
  totalGuests: (json['totalGuests'] as num).toInt(),
  totalTables: (json['totalTables'] as num).toInt(),
  occupancyRate: (json['occupancyRate'] as num).toDouble(),
);

Map<String, dynamic> _$$AnalyticsSummaryModelImplToJson(
  _$AnalyticsSummaryModelImpl instance,
) => <String, dynamic>{
  'totalBookings': instance.totalBookings,
  'confirmedBookings': instance.confirmedBookings,
  'pendingBookings': instance.pendingBookings,
  'totalGuests': instance.totalGuests,
  'totalTables': instance.totalTables,
  'occupancyRate': instance.occupancyRate,
};

_$AnalyticsReportModelImpl _$$AnalyticsReportModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticsReportModelImpl(
  period: AnalyticsPeriodModel.fromJson(json['period'] as Map<String, dynamic>),
  totalBookings: (json['totalBookings'] as num).toInt(),
  completed: (json['completed'] as num).toInt(),
  cancelled: (json['cancelled'] as num).toInt(),
  totalGuests: (json['totalGuests'] as num).toInt(),
  bookings:
      (json['bookings'] as List<dynamic>?)
          ?.map((e) => ReportBookingModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AnalyticsReportModelImplToJson(
  _$AnalyticsReportModelImpl instance,
) => <String, dynamic>{
  'period': instance.period,
  'totalBookings': instance.totalBookings,
  'completed': instance.completed,
  'cancelled': instance.cancelled,
  'totalGuests': instance.totalGuests,
  'bookings': instance.bookings,
};

_$ReportBookingModelImpl _$$ReportBookingModelImplFromJson(
  Map<String, dynamic> json,
) => _$ReportBookingModelImpl(
  id: json['_id'] as String,
  bookingType: json['bookingType'] as String,
  guestName: json['guestName'] as String,
  phone: json['phone'] as String,
  tableId: json['tableId'] as String,
  date: json['date'] as String,
  timeSlot: json['timeSlot'] as String,
  numberOfGuests: (json['numberOfGuests'] as num).toInt(),
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
  endTime: json['endTime'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$ReportBookingModelImplToJson(
  _$ReportBookingModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'bookingType': instance.bookingType,
  'guestName': instance.guestName,
  'phone': instance.phone,
  'tableId': instance.tableId,
  'date': instance.date,
  'timeSlot': instance.timeSlot,
  'numberOfGuests': instance.numberOfGuests,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'endTime': instance.endTime,
  'notes': instance.notes,
};
