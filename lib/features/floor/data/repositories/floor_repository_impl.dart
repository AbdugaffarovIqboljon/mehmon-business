import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/floor/data/datasources/floor_remote_data_source.dart';
import 'package:mehmon/features/floor/data/models/activity_log_model.dart';
import 'package:mehmon/features/floor/data/models/floor_model.dart';
import 'package:mehmon/features/floor/data/models/shift_model.dart';
import 'package:mehmon/features/floor/domain/entities/activity_log_entity.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/entities/shift_entity.dart';
import 'package:mehmon/features/floor/domain/repositories/floor_repository.dart';

class FloorRepositoryImpl implements FloorRepository {
  const FloorRepositoryImpl({required FloorRemoteDataSource dataSource})
      : _dataSource = dataSource;

  final FloorRemoteDataSource _dataSource;

  FloorEntity _toEntity(FloorModel m) => FloorEntity(
        id: m.id,
        number: m.number,
        capacity: m.capacity,
        status: m.status,
        location: m.location,
        x: m.x,
        y: m.y,
        rotation: m.rotation,
        zone: m.zone,
      );

  @override
  Future<Result<List<FloorEntity>>> getTables() async {
    try {
      final models = await _dataSource.getTables();
      return Success(models.map(_toEntity).toList());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<FloorEntity>> createTable({
    required String number,
    required int capacity,
    required String location,
  }) async {
    try {
      final model = await _dataSource.createTable(
        number: number,
        capacity: capacity,
        location: location,
      );
      return Success(_toEntity(model));
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<FloorEntity>> updateTable({
    required String id,
    required String number,
    required int capacity,
    required String location,
  }) async {
    try {
      final model = await _dataSource.updateTable(
        id: id,
        number: number,
        capacity: capacity,
        location: location,
      );
      return Success(_toEntity(model));
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<String>> deleteTable({required String id}) async {
    try {
      final message = await _dataSource.deleteTable(id: id);
      return Success(message);
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> updateTablePosition(
    String id,
    double x,
    double y, {
    double? rotation,
  }) async {
    try {
      await _dataSource.updateTablePosition(id, x, y, rotation: rotation);
      return const Success(null);
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<List<ActivityLogEntity>>> getActivityLog() async {
    try {
      final models = await _dataSource.getActivityLog();
      return Success(models.map((m) => m.toEntity()).toList());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<List<ShiftEntity>>> getShifts() async {
    try {
      final models = await _dataSource.getShifts();
      return Success(models.map((m) => m.toEntity()).toList());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<ShiftEntity>> createShift({
    required String staffName,
    required String startTime,
    required String endTime,
    required String date,
    String? notes,
    List<String>? assignedTables,
  }) async {
    try {
      final model = await _dataSource.createShift(
        staffName: staffName,
        startTime: startTime,
        endTime: endTime,
        date: date,
        notes: notes,
        assignedTables: assignedTables,
      );
      return Success(model.toEntity());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<ShiftEntity>> editShift(
    String id, {
    String? staffName,
    String? startTime,
    String? endTime,
    String? date,
    String? notes,
    List<String>? assignedTables,
  }) async {
    try {
      final model = await _dataSource.editShift(
        id,
        staffName: staffName,
        startTime: startTime,
        endTime: endTime,
        date: date,
        notes: notes,
        assignedTables: assignedTables,
      );
      return Success(model.toEntity());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> deleteShift(String id) async {
    try {
      await _dataSource.deleteShift(id);
      return const Success(null);
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }
}
