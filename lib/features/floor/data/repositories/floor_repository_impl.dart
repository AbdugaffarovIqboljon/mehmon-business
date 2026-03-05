import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/floor/data/datasources/floor_remote_data_source.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/domain/repositories/floor_repository.dart';

class FloorRepositoryImpl implements FloorRepository {
  FloorRepositoryImpl({required FloorRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final FloorRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<FloorEntity>>> getFloors() async {
    try {
      final models = await _remoteDataSource.getFloors();
      final entities = models
          .map(
            (m) => FloorEntity(
              id: m.id,
              name: m.name,
              tableCount: m.tableCount,
              capacity: m.capacity,
            ),
          )
          .toList();
      return Success(entities);
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<FloorEntity>> getFloorById(String id) async {
    try {
      final m = await _remoteDataSource.getFloorById(id);
      return Success(
        FloorEntity(
          id: m.id,
          name: m.name,
          tableCount: m.tableCount,
          capacity: m.capacity,
        ),
      );
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }
}
