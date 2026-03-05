import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/guests/data/datasources/guest_remote_data_source.dart';
import 'package:mehmon/features/guests/data/models/guest_model.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/domain/repositories/guest_repository.dart';

class GuestRepositoryImpl implements GuestRepository {
  GuestRepositoryImpl({required GuestRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final GuestRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<GuestEntity>>> getGuests() async {
    try {
      final models = await _remoteDataSource.getGuests();
      final entities = models.map(_toEntity).toList();
      return Success(entities);
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<GuestEntity>> getGuestById(String id) async {
    try {
      final model = await _remoteDataSource.getGuestById(id);
      return Success(_toEntity(model));
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<GuestEntity>> createGuest(GuestEntity guest) async {
    try {
      final model = await _remoteDataSource.createGuest(_toModel(guest));
      return Success(_toEntity(model));
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<GuestEntity>> updateGuest(GuestEntity guest) async {
    try {
      final model = await _remoteDataSource.updateGuest(_toModel(guest));
      return Success(_toEntity(model));
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  GuestEntity _toEntity(GuestModel m) => GuestEntity(
    id: m.id,
    name: m.name,
    phone: m.phone,
    email: m.email,
    visitCount: m.visitCount,
    notes: m.notes,
    isVip: m.isVip,
  );

  GuestModel _toModel(GuestEntity e) => GuestModel(
    id: e.id,
    name: e.name,
    phone: e.phone,
    email: e.email,
    visitCount: e.visitCount,
    notes: e.notes,
    isVip: e.isVip,
  );
}
