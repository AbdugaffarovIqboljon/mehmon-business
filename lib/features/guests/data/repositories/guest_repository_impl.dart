import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/guests/data/datasources/guest_remote_data_source.dart';
import 'package:mehmon/features/guests/data/models/guest_model.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/domain/repositories/guest_repository.dart';

class GuestRepositoryImpl implements GuestRepository {
  const GuestRepositoryImpl({required GuestRemoteDataSource dataSource})
      : _dataSource = dataSource;

  final GuestRemoteDataSource _dataSource;

  GuestEntity _toEntity(GuestModel m) => GuestEntity(
        id: m.id,
        name: m.name,
        phone: m.phone,
        visitCount: m.visitCount,
        isVIP: m.isVIP,
        lastVisit: m.lastVisit,
        email: m.email,
        notes: m.notes,
      );

  @override
  Future<Result<List<GuestEntity>>> getGuests() async {
    try {
      final models = await _dataSource.getGuests();
      return Success(models.map(_toEntity).toList());
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<GuestEntity>> getGuestById({required String id}) async {
    try {
      final model = await _dataSource.getGuestById(id: id);
      return Success(_toEntity(model));
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<GuestEntity>> createGuest({
    required String name,
    required String phone,
    String? email,
    String? notes,
  }) async {
    try {
      final model = await _dataSource.createGuest(
        name: name,
        phone: phone,
        email: email,
        notes: notes,
      );
      return Success(_toEntity(model));
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<GuestEntity>> updateGuest({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? notes,
  }) async {
    try {
      final model = await _dataSource.updateGuest(
        id: id,
        name: name,
        phone: phone,
        email: email,
        notes: notes,
      );
      return Success(_toEntity(model));
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<String>> deleteGuest({required String id}) async {
    try {
      final message = await _dataSource.deleteGuest(id: id);
      return Success(message);
    } on ApiException catch (e) {
      return Err(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on Object catch (e) {
      return Err(UnknownFailure(message: e.toString()));
    }
  }
}
