// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftModelImpl _$$ShiftModelImplFromJson(Map<String, dynamic> json) =>
    _$ShiftModelImpl(
      id: json['_id'] as String,
      staffName: json['staffName'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      date: json['date'] as String,
      restaurantId: json['restaurantId'] as String,
      createdAt: json['createdAt'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ShiftModelImplToJson(_$ShiftModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'staffName': instance.staffName,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'date': instance.date,
      'restaurantId': instance.restaurantId,
      'createdAt': instance.createdAt,
      'notes': instance.notes,
    };
