import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_entity.freezed.dart';

/// Domain entity representing a restaurant booking.
@freezed
abstract class BookingEntity with _$BookingEntity {
  const factory BookingEntity({
    required String id,
    required String guestName,
    required DateTime dateTime,
    @Default(2) int partySize,
    @Default('pending') String status,
    String? notes,
    String? tableId,
  }) = _BookingEntity;
}
