// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      cafeName: json['cafeName'] as String,
      role: json['role'] as String,
      imageUrl: json['imageUrl'] as String?,
      institutionType: json['institutionType'] as String?,
      address: json['address'] as String?,
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'cafeName': instance.cafeName,
      'role': instance.role,
      'imageUrl': instance.imageUrl,
      'institutionType': instance.institutionType,
      'address': instance.address,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
      'createdAt': instance.createdAt,
    };
