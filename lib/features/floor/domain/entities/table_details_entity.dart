import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_details_entity.freezed.dart';

@freezed
abstract class SimpleTableEntity with _$SimpleTableEntity {
  const factory SimpleTableEntity({
    required String id,
    required String number,
    required int capacity,
    String? zone,
  }) = _SimpleTableEntity;
}

@freezed
abstract class TableCurrentBookingEntity with _$TableCurrentBookingEntity {
  const factory TableCurrentBookingEntity({
    required String guestName,
    required String timeSlot,
    required int numberOfGuests,
    String? endTime,
    String? notes,
  }) = _TableCurrentBookingEntity;
}

@freezed
abstract class TableUpcomingBookingEntity with _$TableUpcomingBookingEntity {
  const factory TableUpcomingBookingEntity({
    required String guestName,
    required String timeSlot,
    required int numberOfGuests,
  }) = _TableUpcomingBookingEntity;
}

@freezed
abstract class TableDetailsEntity with _$TableDetailsEntity {
  const factory TableDetailsEntity({
    required SimpleTableEntity table,
    TableCurrentBookingEntity? currentBooking,
    @Default([]) List<TableUpcomingBookingEntity> upcomingBookings,
  }) = _TableDetailsEntity;
}
