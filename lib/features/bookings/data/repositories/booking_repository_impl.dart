import 'package:dio/dio.dart';
import 'package:mehmon/core/errors/api_exception.dart';
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
      return Success(models.map(_toEntity).toList());
    } on DioException catch (e) {
      return Err(ApiException.fromDioException(e).toFailure());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<BookingEntity>> createBooking({
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    String? endTime,
    String? bookingType,
    String? notes,
  }) async {
    try {
      final model = await _remoteDataSource.createBooking(
        guestName: guestName,
        phone: phone,
        tableId: tableId,
        date: date,
        timeSlot: timeSlot,
        numberOfGuests: numberOfGuests,
        endTime: endTime,
        bookingType: bookingType,
        notes: notes,
      );
      return Success(_toEntity(model));
    } on TableConflictException catch (e, st) {
      return Err(
        TableConflictFailure(conflictWindow: e.conflictWindow, stackTrace: st),
      );
    } on DioException catch (e) {
      return Err(ApiException.fromDioException(e).toFailure());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<BookingEntity>> updateBooking({
    required String id,
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    required String status,
    String? endTime,
    String? bookingType,
    String? notes,
  }) async {
    try {
      final model = await _remoteDataSource.updateBooking(
        id: id,
        guestName: guestName,
        phone: phone,
        tableId: tableId,
        date: date,
        timeSlot: timeSlot,
        numberOfGuests: numberOfGuests,
        status: status,
        endTime: endTime,
        bookingType: bookingType,
        notes: notes,
      );
      return Success(_toEntity(model));
    } on DioException catch (e) {
      return Err(ApiException.fromDioException(e).toFailure());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<String>> deleteBooking({required String id}) async {
    try {
      final message = await _remoteDataSource.deleteBooking(id: id);
      return Success(message);
    } on DioException catch (e) {
      return Err(ApiException.fromDioException(e).toFailure());
    } on ApiException catch (e) {
      return Err(e.toFailure());
    } on Object {
      return const Err(UnknownFailure());
    }
  }

  BookingEntity _toEntity(BookingModel m) => BookingEntity(
        id: m.id,
        guestName: m.guestName,
        phone: m.phone,
        date: m.date,
        timeSlot: m.timeSlot,
        numberOfGuests: m.numberOfGuests,
        status: m.status,
        createdAt: m.createdAt,
        tableInfo: m.tableId == null
            ? null
            : TableInfoEntity(
                id: m.tableId!.id,
                number: m.tableId!.number,
                capacity: m.tableId!.capacity,
              ),
        endTime: m.endTime,
        bookingType: m.bookingType,
        notes: m.notes,
      );
}
