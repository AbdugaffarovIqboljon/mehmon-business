import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/floor/domain/entities/activity_log_entity.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/entities/shift_entity.dart';
import 'package:mehmon/features/floor/domain/entities/table_details_entity.dart';

abstract class FloorRepository {
  Future<Result<List<FloorEntity>>> getTables();

  Future<Result<FloorEntity>> createTable({
    required String number,
    required int capacity,
    required String location,
  });

  Future<Result<FloorEntity>> updateTable({
    required String id,
    required String number,
    required int capacity,
    required String location,
  });

  Future<Result<String>> deleteTable({required String id});

  Future<Result<void>> updateTablePosition(
    String id,
    double x,
    double y,
  );

  Future<Result<TableDetailsEntity>> getTableDetails(String id);

  Future<Result<List<ActivityLogEntity>>> getActivityLog();

  Future<Result<List<ShiftEntity>>> getShifts();

  Future<Result<ShiftEntity>> createShift({
    required String staffName,
    required String startTime,
    required String endTime,
    required String date,
    String? notes,
    List<String>? assignedTables,
  });

  Future<Result<ShiftEntity>> editShift(
    String id, {
    String? staffName,
    String? startTime,
    String? endTime,
    String? date,
    String? notes,
    List<String>? assignedTables,
  });

  Future<Result<void>> deleteShift(String id);
}
