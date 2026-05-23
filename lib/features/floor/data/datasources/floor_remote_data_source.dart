import 'package:dio/dio.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/features/floor/data/models/activity_log_model.dart';
import 'package:mehmon/features/floor/data/models/floor_model.dart';
import 'package:mehmon/features/floor/data/models/shift_model.dart';

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

  Future<void> updateTablePosition(
    String id,
    double x,
    double y, {
    double? rotation,
  });

  Future<List<ActivityLogModel>> getActivityLog();

  Future<List<ShiftModel>> getShifts();

  Future<ShiftModel> createShift({
    required String staffName,
    required String startTime,
    required String endTime,
    required String date,
    String? notes,
    List<String>? assignedTables,
  });

  Future<ShiftModel> editShift(
    String id, {
    String? staffName,
    String? startTime,
    String? endTime,
    String? date,
    String? notes,
    List<String>? assignedTables,
  });

  Future<String> deleteShift(String id);
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

  @override
  Future<void> updateTablePosition(
    String id,
    double x,
    double y, {
    double? rotation,
  }) async {
    try {
      await _dio.put<dynamic>(
        '${ApiConstants.tableById}$id',
        data: {
          'x': x,
          'y': y,
          if (rotation != null) 'rotation': rotation,
        },
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<List<ActivityLogModel>> getActivityLog() async {
    try {
      final response = await _dio.get<dynamic>(ApiConstants.activityLog);
      return (response.data as List)
          .map((e) => ActivityLogModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<List<ShiftModel>> getShifts() async {
    try {
      final response = await _dio.get<dynamic>(ApiConstants.shifts);
      return (response.data as List)
          .map((e) => ShiftModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<ShiftModel> createShift({
    required String staffName,
    required String startTime,
    required String endTime,
    required String date,
    String? notes,
    List<String>? assignedTables,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiConstants.shifts,
        data: {
          'staffName': staffName,
          'startTime': startTime,
          'endTime': endTime,
          'date': date,
          if (notes != null && notes.isNotEmpty) 'notes': notes,
          if (assignedTables != null && assignedTables.isNotEmpty)
            'assignedTables': assignedTables,
        },
      );
      return ShiftModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<ShiftModel> editShift(
    String id, {
    String? staffName,
    String? startTime,
    String? endTime,
    String? date,
    String? notes,
    List<String>? assignedTables,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        ApiConstants.shiftId(id),
        data: {
          if (staffName != null) 'staffName': staffName,
          if (startTime != null) 'startTime': startTime,
          if (endTime != null) 'endTime': endTime,
          if (date != null) 'date': date,
          if (notes != null) 'notes': notes,
          if (assignedTables != null) 'assignedTables': assignedTables,
        },
      );
      return ShiftModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<String> deleteShift(String id) async {
    try {
      final response = await _dio.delete<dynamic>(ApiConstants.shiftId(id));
      return (response.data as Map<String, dynamic>)['message'] as String;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
