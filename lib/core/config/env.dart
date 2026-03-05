/// Environment configuration sourced from `--dart-define` flags.
///
/// Usage:
/// ```sh
/// flutter run \
///   --dart-define=BASE_URL=https://api.example.com \
///   --dart-define=SENTRY_DSN=https://examplePublicKey@o0.ingest.sentry.io/0
/// ```
abstract final class Env {
  /// The base URL for all API requests.
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:8080',
  );

  /// The Sentry DSN for error/performance reporting.
  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN');

  /// Whether we are running in a production build.
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');
}
