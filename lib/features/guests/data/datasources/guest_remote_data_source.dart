import 'package:dio/dio.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/features/guests/data/models/guest_model.dart';

abstract class GuestRemoteDataSource {
  Future<List<GuestModel>> getGuests();

  Future<GuestModel> getGuestById({required String id});

  Future<GuestModel> createGuest({
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  });

  Future<GuestModel> updateGuest({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  });

  Future<String> deleteGuest({required String id});
}

class GuestRemoteDataSourceImpl implements GuestRemoteDataSource {
  const GuestRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<GuestModel>> getGuests() async {
    try {
      final response = await _dio.get<dynamic>(ApiConstants.guests);
      return (response.data as List)
          .map((e) => GuestModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<GuestModel> getGuestById({required String id}) async {
    try {
      final response =
          await _dio.get<dynamic>('${ApiConstants.guestById}$id');
      return GuestModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<GuestModel> createGuest({
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiConstants.guests,
        data: {
          'name': name,
          'phone': phone,
          if (email != null) 'email': email,
          if (notes != null) 'notes': notes,
          if (avatarUrl != null) 'avatarUrl': avatarUrl,
        },
      );
      return GuestModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<GuestModel> updateGuest({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        '${ApiConstants.guestById}$id',
        data: {
          'name': name,
          'phone': phone,
          if (email != null) 'email': email,
          if (notes != null) 'notes': notes,
          if (avatarUrl != null && avatarUrl.isNotEmpty) 'avatarUrl': avatarUrl,
        },
      );
      return GuestModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<String> deleteGuest({required String id}) async {
    try {
      final response =
          await _dio.delete<dynamic>('${ApiConstants.guestById}$id');
      return (response.data as Map<String, dynamic>)['message'] as String;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
