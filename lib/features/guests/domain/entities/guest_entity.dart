import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_entity.freezed.dart';

@freezed
abstract class VisitEntity with _$VisitEntity {
  const factory VisitEntity({
    required String id,
    required String date,
    required String tableNumber,
    required int numberOfGuests,
  }) = _VisitEntity;
}

@freezed
abstract class GuestEntity with _$GuestEntity {
  const factory GuestEntity({
    required String id,
    required String name,
    required String phone,
    required int visitCount,
    required bool isVIP,
    required String lastVisit,
    String? email,
    String? avatarUrl,
    @Default([]) List<VisitEntity> visits,
    String? notes,
    String? lastVisitTableNumber,
    @Default(0) int lastVisitGuestCount,
    String? currentTableId,
    String? bookingId,
    String? bookingTimeSlot,
    String? bookingEndTime,
  }) = _GuestEntity;
}
