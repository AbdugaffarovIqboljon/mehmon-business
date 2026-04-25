// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestModelImpl _$$GuestModelImplFromJson(Map<String, dynamic> json) =>
    _$GuestModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      visitCount: (json['visitCount'] as num).toInt(),
      isVIP: json['isVIP'] as bool,
      lastVisit: json['lastVisit'] as String,
      email: json['email'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$GuestModelImplToJson(_$GuestModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'visitCount': instance.visitCount,
      'isVIP': instance.isVIP,
      'lastVisit': instance.lastVisit,
      'email': instance.email,
      'notes': instance.notes,
    };
