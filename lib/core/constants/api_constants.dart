/// API endpoint paths and configuration constants.
abstract final class ApiConstants {
  static const String baseUrl = 'https://kardise.engineering';

  // ── Auth ───────────────────────────────────────────────────────────
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String refreshToken = '/api/auth/refresh';
  static const String profile = '/api/auth/profile';
  static const String logout = '/api/auth/logout';

  // ── Bookings ──────────────────────────────────────────────────────
  static const String bookings = '/api/bookings';
  static const String bookingById = '/api/bookings/';

  // ── Guests ────────────────────────────────────────────────────────
  static const String guests = '/api/guests';
  static const String guestById = '/api/guests/';

  // ── Tables ────────────────────────────────────────────────────────
  static const String tables = '/api/tables';
  static const String tableById = '/api/tables/';

  // ── Floor ─────────────────────────────────────────────────────────
  static const String floors = '/floors';

  // ── Stats ─────────────────────────────────────────────────────────
  static const String stats = '/stats';

  // ── Timeouts ──────────────────────────────────────────────────────
  static const int connectTimeoutMs = 15000;
  static const int receiveTimeoutMs = 15000;
}
