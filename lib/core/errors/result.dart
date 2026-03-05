import 'package:mehmon/core/errors/failure.dart';

/// A simple Either-like wrapper for operation results.
///
/// Use [Success] for successful outcomes and [Err] for failures.
sealed class Result<T> {
  const Result();

  /// Returns `true` if this is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Returns `true` if this is an [Err].
  bool get isError => this is Err<T>;

  /// Pattern-match on the result.
  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    return switch (this) {
      Success<T>(:final data) => success(data),
      Err<T>(:final failure) => error(failure),
    };
  }
}

/// Represents a successful result containing [data].
class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

/// Represents a failed result containing a [Failure].
class Err<T> extends Result<T> {
  const Err(this.failure);
  final Failure failure;
}
