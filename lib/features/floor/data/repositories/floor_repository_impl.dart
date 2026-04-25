import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/floor/data/datasources/floor_remote_data_source.dart';
import 'package:mehmon/features/floor/data/models/floor_model.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
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
      );

  @override
  Future<Result<List<FloorEntity>>> getTables() async {
    try {
      final models = await _dataSource.getTables();
      return Success(models.map(_toEntity).toList());
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
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
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
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
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<String>> deleteTable({required String id}) async {
    try {
      final message = await _dataSource.deleteTable(id: id);
      return Success(message);
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }
}
