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
        email: m.email,
        visitCount: m.visitCount,
        avatarUrl: m.avatarUrl,
        visits: m.visits
            .map((v) => VisitEntity(
                  id: v.id,
                  date: v.date,
                  tableNumber: v.tableNumber,
                  numberOfGuests: v.numberOfGuests,
                ))
            .toList(),
        notes: m.notes,
        isVIP: m.isVIP,
        lastVisit: m.lastVisit,
        lastVisitTableNumber: m.lastVisitTableNumber,
        lastVisitGuestCount: m.lastVisitGuestCount,
        currentTableId: m.currentTableId,
        bookingId: m.bookingId,
        bookingTimeSlot: m.bookingTimeSlot,
        bookingEndTime: m.bookingEndTime,
      );

  @override
  Future<Result<List<GuestEntity>>> getGuests() async {
    try {
      final models = await _dataSource.getGuests();
      return Success(models.map(_toEntity).toList());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<List<GuestEntity>>> getGuestsInHall() async {
    try {
      final models = await _dataSource.getGuestsInHall();
      return Success(models.map(_toEntity).toList());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<GuestEntity>> getGuestById({required String id}) async {
    try {
      final model = await _dataSource.getGuestById(id: id);
      return Success(_toEntity(model));
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<GuestEntity>> createGuest({
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  }) async {
    try {
      final model = await _dataSource.createGuest(
        name: name,
        phone: phone,
        email: email,
        notes: notes,
        avatarUrl: avatarUrl,
      );
      return Success(_toEntity(model));
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<GuestEntity>> updateGuest({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? notes,
    String? avatarUrl,
  }) async {
    try {
      final model = await _dataSource.updateGuest(
        id: id,
        name: name,
        phone: phone,
        email: email,
        notes: notes,
        avatarUrl: avatarUrl,
      );
      return Success(_toEntity(model));
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<String>> deleteGuest({required String id}) async {
    try {
      final message = await _dataSource.deleteGuest(id: id);
      return Success(message);
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }
}
