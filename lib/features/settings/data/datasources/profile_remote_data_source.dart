import 'package:dio/dio.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/features/settings/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();

  Future<ProfileModel> updateProfile({
    String? name,
    String? phone,
    String? cafeName,
    String? imageUrl,
    String? institutionType,
    String? address,
    String? openingTime,
    String? closingTime,
  });

  Future<String> logout();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await _dio.get<dynamic>(ApiConstants.profile);
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    String? name,
    String? phone,
    String? cafeName,
    String? imageUrl,
    String? institutionType,
    String? address,
    String? openingTime,
    String? closingTime,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        ApiConstants.profile,
        data: {
          if (name != null) 'name': name,
          if (phone != null) 'phone': phone,
          if (cafeName != null) 'cafeName': cafeName,
          if (imageUrl != null) 'imageUrl': imageUrl,
          if (institutionType != null) 'institutionType': institutionType,
          if (address != null) 'address': address,
          if (openingTime != null) 'openingTime': openingTime,
          if (closingTime != null) 'closingTime': closingTime,
        },
      );
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<String> logout() async {
    try {
      final response = await _dio.post<dynamic>(ApiConstants.logout);
      return (response.data as Map<String, dynamic>)['message'] as String;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
