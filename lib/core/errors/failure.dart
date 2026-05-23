/// Base failure type for the application.
sealed class Failure implements Exception {
  const Failure({required this.message, this.stackTrace});

  final String message;
  final StackTrace? stackTrace;

  String get userMessage => switch (this) {
        NetworkFailure() => "Internet aloqasi yo'q",
        TableConflictFailure(:final conflictWindow) =>
          'Bu vaqtda stol band: $conflictWindow',
        ServerFailure(:final statusCode, :final message) => switch (statusCode) {
            null => _isTechnical(message) ? 'Xatolik yuz berdi' : message,
            401 => 'Sessiya tugadi. Qayta kiring',
            403 => "Bu amalni bajarishga ruxsat yo'q",
            404 => "Ma'lumot topilmadi",
            >= 500 => "Serverda xatolik. Biroz kutib urinib ko'ring",
            _ => _isTechnical(message) ? 'Xatolik yuz berdi' : message,
          },
        CacheFailure() => 'Mahalliy xatolik',
        UnknownFailure() => 'Kutilmagan xatolik',
      };

  static bool _isTechnical(String? message) {
    if (message == null) return true;
    const technicalPrefixes = [
      'noInternet',
      'timeout',
      'serverError',
      'unknown',
      'cancelled',
      'Exception',
      'DioException',
      'SocketException',
    ];
    return technicalPrefixes.any((p) => message.startsWith(p));
  }

  @override
  String toString() => 'Failure: $message';
}

/// Failure originating from a server/API response.
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.stackTrace,
    this.statusCode,
  });

  final int? statusCode;
}

/// Failure due to network connectivity issues.
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection',
    super.stackTrace,
  });
}

/// Failure originating from local cache/storage.
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Cache read/write error',
    super.stackTrace,
  });
}

/// Catch-all for unexpected failures.
class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unexpected error occurred',
    super.stackTrace,
  });
}

/// 409 TABLE_CONFLICT: the requested slot overlaps an existing booking.
class TableConflictFailure extends Failure {
  const TableConflictFailure({
    required this.conflictWindow,
    super.stackTrace,
  }) : super(message: 'TABLE_CONFLICT');

  /// Human-readable window, e.g. "18:00–20:00".
  final String conflictWindow;
}
