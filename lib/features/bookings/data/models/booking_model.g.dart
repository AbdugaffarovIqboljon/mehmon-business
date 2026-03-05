// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['id'] as String,
      guestName: json['guest_name'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      partySize: (json['party_size'] as num?)?.toInt() ?? 2,
      status: json['status'] as String? ?? 'pending',
      notes: json['notes'] as String?,
      tableId: json['table_id'] as String?,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_name': instance.guestName,
      'date_time': instance.dateTime.toIso8601String(),
      'party_size': instance.partySize,
      'status': instance.status,
      'notes': instance.notes,
      'table_id': instance.tableId,
    };
