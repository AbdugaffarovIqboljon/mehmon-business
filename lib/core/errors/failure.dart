/// Base failure type for the application.
sealed class Failure {
  const Failure({required this.message, this.stackTrace});

  final String message;
  final StackTrace? stackTrace;

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
