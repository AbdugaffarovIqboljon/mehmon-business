import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';

/// Contract for floor plan operations.
abstract class FloorRepository {
  Future<Result<List<FloorEntity>>> getFloors();
  Future<Result<FloorEntity>> getFloorById(String id);
}
