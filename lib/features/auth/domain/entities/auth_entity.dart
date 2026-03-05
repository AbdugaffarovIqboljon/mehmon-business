import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

/// Domain entity representing an authenticated user.
@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String id,
    required String email,
    required String name,
    String? phone,
    String? avatarUrl,
    @Default('staff') String role,
  }) = _AuthEntity;
}
