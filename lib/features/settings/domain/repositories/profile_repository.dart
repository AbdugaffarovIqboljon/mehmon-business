import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/settings/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Result<ProfileEntity>> getProfile();

  Future<Result<ProfileEntity>> updateProfile({
    required String name,
    required String phone,
    required String cafeName,
    String? imageUrl,
    String? institutionType,
    String? address,
    String? openingTime,
    String? closingTime,
  });

  Future<Result<String>> logout();
}
