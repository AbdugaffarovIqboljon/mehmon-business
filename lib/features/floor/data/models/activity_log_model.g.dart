// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityLogModelImpl _$$ActivityLogModelImplFromJson(
  Map<String, dynamic> json,
) => _$ActivityLogModelImpl(
  id: json['_id'] as String,
  restaurantId: json['restaurantId'] as String,
  action: json['action'] as String,
  details: json['details'] as String,
  performedBy: json['performedBy'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$$ActivityLogModelImplToJson(
  _$ActivityLogModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'restaurantId': instance.restaurantId,
  'action': instance.action,
  'details': instance.details,
  'performedBy': instance.performedBy,
  'createdAt': instance.createdAt,
};
