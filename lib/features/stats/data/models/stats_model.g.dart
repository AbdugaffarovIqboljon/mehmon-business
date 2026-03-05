// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsModelImpl _$$StatsModelImplFromJson(Map<String, dynamic> json) =>
    _$StatsModelImpl(
      totalBookings: (json['total_bookings'] as num).toInt(),
      totalGuests: (json['total_guests'] as num).toInt(),
      occupancyRate: (json['occupancy_rate'] as num).toDouble(),
      revenue: (json['revenue'] as num).toDouble(),
      period: json['period'] as String? ?? 'daily',
    );

Map<String, dynamic> _$$StatsModelImplToJson(_$StatsModelImpl instance) =>
    <String, dynamic>{
      'total_bookings': instance.totalBookings,
      'total_guests': instance.totalGuests,
      'occupancy_rate': instance.occupancyRate,
      'revenue': instance.revenue,
      'period': instance.period,
    };
