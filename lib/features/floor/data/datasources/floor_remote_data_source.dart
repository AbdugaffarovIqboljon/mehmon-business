import 'package:dio/dio.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/features/floor/data/models/floor_model.dart';

abstract class FloorRemoteDataSource {
  Future<List<FloorModel>> getTables();

  Future<FloorModel> createTable({
    required String number,
    required int capacity,
    required String location,
  });

  Future<FloorModel> updateTable({
    required String id,
    required String number,
    required int capacity,
    required String location,
  });

  Future<String> deleteTable({required String id});
}

class FloorRemoteDataSourceImpl implements FloorRemoteDataSource {
  const FloorRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<FloorModel>> getTables() async {
    try {
      final response = await _dio.get<dynamic>(ApiConstants.tables);
      return (response.data as List)
          .map((e) => FloorModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<FloorModel> createTable({
    required String number,
    required int capacity,
    required String location,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiConstants.tables,
        data: {
          'number': number,
          'capacity': capacity,
          'location': location,
        },
      );
      return FloorModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<FloorModel> updateTable({
    required String id,
    required String number,
    required int capacity,
    required String location,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        '${ApiConstants.tableById}$id',
        data: {
          'number': number,
          'capacity': capacity,
          'location': location,
        },
      );
      return FloorModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<String> deleteTable({required String id}) async {
    try {
      final response = await _dio.delete<dynamic>(
        '${ApiConstants.tableById}$id',
      );
      return (response.data as Map<String, dynamic>)['message'] as String;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
