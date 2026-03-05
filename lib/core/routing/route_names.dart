/// Centralized route name and path constants.
abstract final class RouteNames {
  // ── Onboarding / Auth ──────────────────────────────────────────────
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String register = 'register';
  static const String profileSetup = 'profile-setup';

  // ── Main App ──────────────────────────────────────────────────────
  static const String floor = 'floor';
  static const String bookings = 'bookings';
  static const String guests = 'guests';
  static const String stats = 'stats';
  static const String settings = 'settings';
}

/// Path constants corresponding to [RouteNames].
abstract final class RoutePaths {
  // ── Onboarding / Auth ──────────────────────────────────────────────
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String profileSetup = '/profile-setup';

  // ── Main App ──────────────────────────────────────────────────────
  static const String floor = '/floor';
  static const String bookings = '/bookings';
  static const String guests = '/guests';
  static const String stats = '/stats';
  static const String settings = '/settings';
}
