// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorModelImpl _$$FloorModelImplFromJson(Map<String, dynamic> json) =>
    _$FloorModelImpl(
      id: json['_id'] as String,
      number: json['number'] as String,
      capacity: (json['capacity'] as num).toInt(),
      status: json['status'] as String,
      location: json['location'] as String,
      x: (json['x'] as num?)?.toDouble() ?? 0.0,
      y: (json['y'] as num?)?.toDouble() ?? 0.0,
      zone: json['zone'] as String?,
    );

Map<String, dynamic> _$$FloorModelImplToJson(_$FloorModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'number': instance.number,
      'capacity': instance.capacity,
      'status': instance.status,
      'location': instance.location,
      'x': instance.x,
      'y': instance.y,
      'zone': instance.zone,
    };
