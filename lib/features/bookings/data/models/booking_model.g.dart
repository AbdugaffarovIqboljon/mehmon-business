// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableInfoModelImpl _$$TableInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$TableInfoModelImpl(
      id: json['_id'] as String,
      number: json['number'] as String,
      capacity: (json['capacity'] as num).toInt(),
    );

Map<String, dynamic> _$$TableInfoModelImplToJson(
  _$TableInfoModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'number': instance.number,
  'capacity': instance.capacity,
};

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['_id'] as String,
      guestName: json['guestName'] as String,
      phone: json['phone'] as String,
      date: json['date'] as String,
      timeSlot: json['timeSlot'] as String,
      numberOfGuests: (json['numberOfGuests'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      tableId: _tableInfoFromJson(json['tableId']),
      endTime: json['endTime'] as String?,
      bookingType: _bookingTypeFromJson(json['bookingType']),
      status: json['status'] as String? ?? 'pending',
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'guestName': instance.guestName,
      'phone': instance.phone,
      'date': instance.date,
      'timeSlot': instance.timeSlot,
      'numberOfGuests': instance.numberOfGuests,
      'createdAt': instance.createdAt,
      'tableId': _tableInfoToJson(instance.tableId),
      'endTime': instance.endTime,
      'bookingType': _bookingTypeToJson(instance.bookingType),
      'status': instance.status,
      'notes': instance.notes,
    };
