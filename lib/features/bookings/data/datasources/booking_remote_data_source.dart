import 'package:dio/dio.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/errors/api_exception.dart';
import 'package:mehmon/features/bookings/data/models/booking_model.dart';

abstract class BookingRemoteDataSource {
  Future<List<BookingModel>> getBookings();

  Future<BookingModel> createBooking({
    required String guestName,
    required String phone,
    required String tableId,
    required String date,
    required String timeSlot,
    required int numberOfGuests,
    String? endTime,
    String? bookingType,
    String? notes,
  });

  Future<BookingModel> updateBooking({
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
  });

  Future<String> deleteBooking({required String id});
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  const BookingRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<BookingModel>> getBookings() async {
    try {
      final response = await _dio.get<Object>(ApiConstants.bookings);
      return (response.data! as List)
          .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<BookingModel> createBooking({
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
      final response = await _dio.post<Object>(
        ApiConstants.bookings,
        data: {
          'guestName': guestName,
          'phone': phone,
          'tableId': tableId,
          'date': date,
          'timeSlot': timeSlot,
          'numberOfGuests': numberOfGuests,
          if (endTime != null) 'endTime': endTime,
          if (bookingType != null) 'bookingType': bookingType,
          if (notes != null) 'notes': notes,
        },
      );
      return BookingModel.fromJson(response.data! as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response?.statusCode == 409 &&
          e.response?.data is Map<String, dynamic>) {
        final body = e.response!.data as Map<String, dynamic>;
        if (body['code'] == 'TABLE_CONFLICT') {
          final conflicting =
              body['conflictingBooking'] as Map<String, dynamic>?;
          if (conflicting != null) {
            throw TableConflictException(
              '${conflicting['timeSlot']}–${conflicting['endTime']}',
            );
          }
        }
      }
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<BookingModel> updateBooking({
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
      final response = await _dio.put<Object>(
        '${ApiConstants.bookingById}$id',
        data: {
          'guestName': guestName,
          'phone': phone,
          'tableId': tableId,
          'date': date,
          'timeSlot': timeSlot,
          'numberOfGuests': numberOfGuests,
          'status': status,
          if (endTime != null) 'endTime': endTime,
          if (bookingType != null) 'bookingType': bookingType,
          if (notes != null) 'notes': notes,
        },
      );
      return BookingModel.fromJson(response.data! as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<String> deleteBooking({required String id}) async {
    try {
      final response = await _dio.delete<Object>(
        '${ApiConstants.bookingById}$id',
      );
      final data = response.data! as Map<String, dynamic>;
      return data['message'] as String;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
