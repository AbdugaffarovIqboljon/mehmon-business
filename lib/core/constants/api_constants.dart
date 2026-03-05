/// API endpoint paths and configuration constants.
///
/// The base URL is resolved from the Env class at runtime.
abstract final class ApiConstants {
  // ── Auth ───────────────────────────────────────────────────────────
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';

  // ── Bookings ──────────────────────────────────────────────────────
  static const String bookings = '/bookings';

  // ── Guests ────────────────────────────────────────────────────────
  static const String guests = '/guests';

  // ── Floor ─────────────────────────────────────────────────────────
  static const String floors = '/floors';

  // ── Stats ─────────────────────────────────────────────────────────
  static const String stats = '/stats';

  // ── Timeouts ──────────────────────────────────────────────────────
  static const int connectTimeoutMs = 15000;
  static const int receiveTimeoutMs = 15000;
}
