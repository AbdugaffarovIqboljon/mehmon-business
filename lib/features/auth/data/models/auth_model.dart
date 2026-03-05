import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

/// Data model for API serialization of auth responses.
@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String id,
    required String email,
    required String name,
    String? phone,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @Default('staff') String role,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
