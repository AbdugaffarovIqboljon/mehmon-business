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
          if (notes != null) 'notes': notes,
        },
      );
      return _parseBookingResponse(response.data! as Map<String, dynamic>);
    } on DioException catch (e) {
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
          if (notes != null) 'notes': notes,
        },
      );
      return _parseBookingResponse(response.data! as Map<String, dynamic>);
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

  // POST/PUT responses return tableId as a plain String instead of an object.
  BookingModel _parseBookingResponse(Map<String, dynamic> data) {
    final tableIdRaw = data['tableId'];
    final tableInfo = tableIdRaw is Map<String, dynamic>
        ? TableInfoModel.fromJson(tableIdRaw)
        : TableInfoModel(
            id: tableIdRaw as String,
            number: '',
            capacity: 0,
          );
    return BookingModel.fromJson(data).copyWith(tableId: tableInfo);
  }
}
