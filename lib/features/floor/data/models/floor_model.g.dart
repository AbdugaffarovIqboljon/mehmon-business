// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorModelImpl _$$FloorModelImplFromJson(Map<String, dynamic> json) =>
    _$FloorModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      tableCount: (json['table_count'] as num?)?.toInt() ?? 0,
      capacity: (json['capacity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FloorModelImplToJson(_$FloorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'table_count': instance.tableCount,
      'capacity': instance.capacity,
    };
