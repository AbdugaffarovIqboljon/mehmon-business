import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';

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
}
