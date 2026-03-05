import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_entity.freezed.dart';

/// Domain entity representing a restaurant guest.
@freezed
abstract class GuestEntity with _$GuestEntity {
  const factory GuestEntity({
    required String id,
    required String name,
    String? phone,
    String? email,
    @Default(0) int visitCount,
    String? notes,
    @Default(false) bool isVip,
  }) = _GuestEntity;
}
