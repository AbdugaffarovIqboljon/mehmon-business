import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/errors/result.dart';
import 'package:mehmon/features/bookings/data/datasources/booking_remote_data_source.dart';
import 'package:mehmon/features/bookings/data/models/booking_model.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  BookingRepositoryImpl({required BookingRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final BookingRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<BookingEntity>>> getBookings() async {
    try {
      final models = await _remoteDataSource.getBookings();
      final entities = models.map(_toEntity).toList();
      return Success(entities);
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<BookingEntity>> getBookingById(String id) async {
    try {
      final model = await _remoteDataSource.getBookingById(id);
      return Success(_toEntity(model));
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<BookingEntity>> createBooking(BookingEntity booking) async {
    try {
      final model = await _remoteDataSource.createBooking(
        BookingModel(
          id: booking.id,
          guestName: booking.guestName,
          dateTime: booking.dateTime,
          partySize: booking.partySize,
          status: booking.status,
          notes: booking.notes,
          tableId: booking.tableId,
        ),
      );
      return Success(_toEntity(model));
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  Future<Result<void>> cancelBooking(String id) async {
    try {
      await _remoteDataSource.cancelBooking(id);
      return const Success(null);
    } on Exception catch (e, st) {
      return Err(ServerFailure(message: e.toString(), stackTrace: st));
    }
  }

  BookingEntity _toEntity(BookingModel m) => BookingEntity(
    id: m.id,
    guestName: m.guestName,
    dateTime: m.dateTime,
    partySize: m.partySize,
    status: m.status,
    notes: m.notes,
    tableId: m.tableId,
  );
}
