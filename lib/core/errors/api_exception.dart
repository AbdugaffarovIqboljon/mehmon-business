import 'package:dio/dio.dart';
import 'package:mehmon/core/errors/failure.dart';

/// Exception thrown by the networking layer for API errors.
class ApiException implements Exception {
  const ApiException({required this.message, this.statusCode, this.error});

  factory ApiException.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return const ApiException(message: 'noInternet');
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const ApiException(message: 'timeout');
      case DioExceptionType.badResponse:
        final data = e.response?.data;
        final serverMsg = data is Map<String, dynamic>
            ? data['message'] as String?
            : null;
        return ApiException(
          message: serverMsg ?? 'serverError',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return const ApiException(message: 'cancelled');
    }
  }

  final String message;
  final int? statusCode;
  final Object? error;

  Failure toFailure() {
    if (message == 'noInternet') return const NetworkFailure();
    if (message == 'timeout') return const ServerFailure(message: 'timeout');
    return ServerFailure(message: message, statusCode: statusCode);
  }

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message)';
}

/// Thrown when POST /api/bookings returns 409 with code: "TABLE_CONFLICT".
class TableConflictException implements Exception {
  const TableConflictException(this.conflictWindow);

  /// Human-readable overlap window, e.g. "18:00–20:00".
  final String conflictWindow;
}
