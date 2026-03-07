import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_entity.freezed.dart';

@freezed
abstract class GuestVisitEntity with _$GuestVisitEntity {
  const factory GuestVisitEntity({
    required String date,
    required String tableLabel,
    @Default(1) int guestCount,
  }) = _GuestVisitEntity;
}

/// Domain entity representing a restaurant guest.
@freezed
abstract class GuestEntity with _$GuestEntity {
  const factory GuestEntity({
    required String id,
    required String name,
    String? avatarUrl,
    String? phone,
    String? email,
    String? tableLabel,
    String? visitDate,
    @Default(1) int guestCount,
    @Default(0) int visitCount,
    String? notes,
    @Default(false) bool isVip,
    @Default(false) bool isInHall,
    @Default(<GuestVisitEntity>[]) List<GuestVisitEntity> visitHistory,
  }) = _GuestEntity;
}
