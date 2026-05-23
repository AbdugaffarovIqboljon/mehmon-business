import 'package:dio/dio.dart';

/// Exception thrown by the networking layer for API errors.
class ApiException implements Exception {
  const ApiException({required this.message, this.statusCode, this.error});

  factory ApiException.fromDioException(DioException e) {
    final data = e.response?.data;
    final message =
        (data is Map<String, dynamic> ? data['message'] as String? : null) ??
            e.message ??
            'Unknown error';
    return ApiException(
      message: message,
      statusCode: e.response?.statusCode,
    );
  }

  final String message;
  final int? statusCode;
  final Object? error;

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
