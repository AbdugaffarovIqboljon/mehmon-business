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
  static const String guestsInHall = '/api/guests/in-hall';

  // ── Tables ────────────────────────────────────────────────────────
  static const String tables = '/api/tables';
  static const String tableById = '/api/tables/';
  static const String tableDetails = '/api/tables/{id}/details';
  static String tableDetailsById(String id) => '/api/tables/$id/details';

  // ── Analytics ─────────────────────────────────────────────────────
  static const String analyticsSummary = '/api/analytics/summary';
  static const String analyticsReports = '/api/analytics/reports';

  // ── Activity Log ──────────────────────────────────────────────────
  static const String activityLog = '/api/activity-log';

  // ── Shifts ────────────────────────────────────────────────────────
  static const String shifts = '/api/shifts';
  static const String shiftById = '/api/shifts/{id}';
  static String shiftId(String id) => '/api/shifts/$id';

  // ── Upload ────────────────────────────────────────────────────────
  static const String upload = '/api/upload';

  // ── Timeouts ──────────────────────────────────────────────────────
  static const int connectTimeoutMs = 15000;
  static const int receiveTimeoutMs = 15000;
}
