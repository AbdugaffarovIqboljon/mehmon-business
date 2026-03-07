// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestVisitModelImpl _$$GuestVisitModelImplFromJson(
  Map<String, dynamic> json,
) => _$GuestVisitModelImpl(
  date: json['date'] as String,
  tableLabel: json['table_label'] as String,
  guestCount: (json['guest_count'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$$GuestVisitModelImplToJson(
  _$GuestVisitModelImpl instance,
) => <String, dynamic>{
  'date': instance.date,
  'table_label': instance.tableLabel,
  'guest_count': instance.guestCount,
};

_$GuestModelImpl _$$GuestModelImplFromJson(Map<String, dynamic> json) =>
    _$GuestModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      tableLabel: json['table_label'] as String?,
      visitDate: json['visit_date'] as String?,
      guestCount: (json['guest_count'] as num?)?.toInt() ?? 1,
      visitCount: (json['visit_count'] as num?)?.toInt() ?? 0,
      notes: json['notes'] as String?,
      isVip: json['is_vip'] as bool? ?? false,
      isInHall: json['is_in_hall'] as bool? ?? false,
      visitHistory:
          (json['visit_history'] as List<dynamic>?)
              ?.map((e) => GuestVisitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GuestVisitModel>[],
    );

Map<String, dynamic> _$$GuestModelImplToJson(_$GuestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'phone': instance.phone,
      'email': instance.email,
      'table_label': instance.tableLabel,
      'visit_date': instance.visitDate,
      'guest_count': instance.guestCount,
      'visit_count': instance.visitCount,
      'notes': instance.notes,
      'is_vip': instance.isVip,
      'is_in_hall': instance.isInHall,
      'visit_history': instance.visitHistory,
    };
