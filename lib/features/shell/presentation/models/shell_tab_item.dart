import 'package:mehmon/core/routing/route_names.dart';

/// Navigation metadata for one tab inside the authenticated shell.
class ShellTabItem {
  const ShellTabItem({
    required this.label,
    required this.routeName,
    required this.iconAsset,
  });

  final String label;
  final String routeName;
  final String iconAsset;
}

/// Centralized tab list for the authenticated shell.
abstract final class ShellTabItems {
  static const List<ShellTabItem> authenticated = [
    ShellTabItem(
      label: 'Зал',
      routeName: RouteNames.floor,
      iconAsset: 'assets/icons/ic_hall.png',
    ),
    ShellTabItem(
      label: 'Брони',
      routeName: RouteNames.bookings,
      iconAsset: 'assets/icons/ic_reservation.png',
    ),
    ShellTabItem(
      label: 'Гости',
      routeName: RouteNames.guests,
      iconAsset: 'assets/icons/ic_guests.png',
    ),
    ShellTabItem(
      label: 'Профиль',
      routeName: RouteNames.settings,
      iconAsset: 'assets/icons/ic_profile.png',
    ),
  ];
}
