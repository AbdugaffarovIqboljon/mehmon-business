// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestModelImpl _$$GuestModelImplFromJson(Map<String, dynamic> json) =>
    _$GuestModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      visitCount: (json['visit_count'] as num?)?.toInt() ?? 0,
      notes: json['notes'] as String?,
      isVip: json['is_vip'] as bool? ?? false,
    );

Map<String, dynamic> _$$GuestModelImplToJson(_$GuestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'visit_count': instance.visitCount,
      'notes': instance.notes,
      'is_vip': instance.isVip,
    };
