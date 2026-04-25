import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required String email,
    required String role,
  }) = _UserEntity;
}

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String accessToken,
    required String refreshToken,
    required UserEntity user,
  }) = _AuthEntity;
}
