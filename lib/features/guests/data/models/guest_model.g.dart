// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitModelImpl _$$VisitModelImplFromJson(Map<String, dynamic> json) =>
    _$VisitModelImpl(
      id: json['_id'] as String,
      date: json['date'] as String,
      tableNumber: json['tableNumber'] as String,
      numberOfGuests: (json['numberOfGuests'] as num).toInt(),
    );

Map<String, dynamic> _$$VisitModelImplToJson(_$VisitModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'tableNumber': instance.tableNumber,
      'numberOfGuests': instance.numberOfGuests,
    };

_$GuestModelImpl _$$GuestModelImplFromJson(Map<String, dynamic> json) =>
    _$GuestModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      visitCount: (json['visitCount'] as num).toInt(),
      visits:
          (json['visits'] as List<dynamic>?)
              ?.map((e) => VisitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isVIP: json['isVIP'] as bool,
      lastVisit: json['lastVisit'] as String,
      lastVisitGuestCount: (json['lastVisitGuestCount'] as num?)?.toInt() ?? 0,
      email: json['email'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      notes: json['notes'] as String?,
      lastVisitTableNumber: json['lastVisitTableNumber'] as String?,
      currentTableId: json['currentTableId'] as String?,
      bookingId: json['bookingId'] as String?,
      bookingTimeSlot: json['bookingTimeSlot'] as String?,
      bookingEndTime: json['bookingEndTime'] as String?,
    );

Map<String, dynamic> _$$GuestModelImplToJson(_$GuestModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'visitCount': instance.visitCount,
      'visits': instance.visits,
      'isVIP': instance.isVIP,
      'lastVisit': instance.lastVisit,
      'lastVisitGuestCount': instance.lastVisitGuestCount,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'notes': instance.notes,
      'lastVisitTableNumber': instance.lastVisitTableNumber,
      'currentTableId': instance.currentTableId,
      'bookingId': instance.bookingId,
      'bookingTimeSlot': instance.bookingTimeSlot,
      'bookingEndTime': instance.bookingEndTime,
    };
