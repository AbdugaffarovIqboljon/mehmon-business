/// Centralized route name and path constants.
abstract final class RouteNames {
  // ── Onboarding / Auth ──────────────────────────────────────────────
  static const String languageSelect = 'language-select';
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String register = 'register';
  static const String profileSetup = 'profile-setup';
  static const String restaurantSetup = 'restaurant-setup';

  // ── Main App ──────────────────────────────────────────────────────
  static const String floor = 'floor';
  static const String bookings = 'bookings';
  static const String guests = 'guests';
  static const String guestDetail = 'guest-detail';
  static const String stats = 'stats';
  static const String settings = 'settings';
  static const String editProfile = 'edit-profile';
  static const String aboutUs = 'about-us';
  static const String floorDashboard = 'floor-dashboard';
  static const String floorChronology = 'floor-chronology';
  static const String floorReports = 'floor-reports';
  static const String floorShifts = 'floor-shifts';
  static const String floorPosIntegration = 'floor-pos-integration';
  static const String floorMenuSettings = 'floor-menu-settings';
}

/// Path constants corresponding to [RouteNames].
abstract final class RoutePaths {
  // ── Onboarding / Auth ──────────────────────────────────────────────
  static const String languageSelect = '/language-select';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String profileSetup = '/profile-setup';
  static const String restaurantSetup = '/restaurant-setup';

  // ── Main App ──────────────────────────────────────────────────────
  static const String floor = '/floor';
  static const String bookings = '/bookings';
  static const String guests = '/guests';
  static const String guestDetail = '/guests/detail/:guestId';
  static const String stats = '/stats';
  static const String settings = '/settings';
  static const String editProfile = '/edit-profile';
  static const String aboutUs = '/about-us';
  static const String floorDashboard = '/floor/dashboard';
  static const String floorChronology = '/floor/chronology';
  static const String floorReports = '/floor/reports';
  static const String floorShifts = '/floor/shifts';
  static const String floorPosIntegration = '/floor/pos-integration';
  static const String floorMenuSettings = '/floor/menu-settings';
}

/// Path parameter names used in router declarations.
abstract final class RouteParams {
  static const String guestId = 'guestId';
}
