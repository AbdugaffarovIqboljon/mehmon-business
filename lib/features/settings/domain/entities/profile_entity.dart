import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String id,
    required String name,
    required String phone,
    required String cafeName,
    required String role,
    String? imageUrl,
    String? institutionType,
    String? address,
    String? openingTime,
    String? closingTime,
    String? createdAt,
    @Default([]) List<String> zones,
    @Default(false) bool isSetupCompleted,
  }) = _ProfileEntity;
}
