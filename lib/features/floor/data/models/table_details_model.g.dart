// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimpleTableModelImpl _$$SimpleTableModelImplFromJson(
  Map<String, dynamic> json,
) => _$SimpleTableModelImpl(
  id: json['_id'] as String,
  number: json['number'] as String,
  capacity: (json['capacity'] as num).toInt(),
  zone: json['zone'] as String?,
);

Map<String, dynamic> _$$SimpleTableModelImplToJson(
  _$SimpleTableModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'number': instance.number,
  'capacity': instance.capacity,
  'zone': instance.zone,
};

_$TableCurrentBookingModelImpl _$$TableCurrentBookingModelImplFromJson(
  Map<String, dynamic> json,
) => _$TableCurrentBookingModelImpl(
  guestName: json['guestName'] as String,
  timeSlot: json['timeSlot'] as String,
  numberOfGuests: (json['numberOfGuests'] as num).toInt(),
  endTime: json['endTime'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$TableCurrentBookingModelImplToJson(
  _$TableCurrentBookingModelImpl instance,
) => <String, dynamic>{
  'guestName': instance.guestName,
  'timeSlot': instance.timeSlot,
  'numberOfGuests': instance.numberOfGuests,
  'endTime': instance.endTime,
  'notes': instance.notes,
};

_$TableUpcomingBookingModelImpl _$$TableUpcomingBookingModelImplFromJson(
  Map<String, dynamic> json,
) => _$TableUpcomingBookingModelImpl(
  guestName: json['guestName'] as String,
  timeSlot: json['timeSlot'] as String,
  numberOfGuests: (json['numberOfGuests'] as num).toInt(),
);

Map<String, dynamic> _$$TableUpcomingBookingModelImplToJson(
  _$TableUpcomingBookingModelImpl instance,
) => <String, dynamic>{
  'guestName': instance.guestName,
  'timeSlot': instance.timeSlot,
  'numberOfGuests': instance.numberOfGuests,
};

_$TableDetailsModelImpl _$$TableDetailsModelImplFromJson(
  Map<String, dynamic> json,
) => _$TableDetailsModelImpl(
  table: SimpleTableModel.fromJson(json['table'] as Map<String, dynamic>),
  currentBooking: json['currentBooking'] == null
      ? null
      : TableCurrentBookingModel.fromJson(
          json['currentBooking'] as Map<String, dynamic>,
        ),
  upcomingBookings:
      (json['upcomingBookings'] as List<dynamic>?)
          ?.map(
            (e) =>
                TableUpcomingBookingModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TableDetailsModelImplToJson(
  _$TableDetailsModelImpl instance,
) => <String, dynamic>{
  'table': instance.table,
  'currentBooking': instance.currentBooking,
  'upcomingBookings': instance.upcomingBookings,
};
