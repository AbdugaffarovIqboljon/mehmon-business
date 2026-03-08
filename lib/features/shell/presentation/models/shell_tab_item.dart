import 'package:flutter/widgets.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/l10n/app_localizations.dart';

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
  static List<ShellTabItem> getAuthenticated(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return [
      ShellTabItem(
        label: loc.tabFloor,
        routeName: RouteNames.floor,
        iconAsset: 'assets/icons/ic_hall.png',
      ),
      ShellTabItem(
        label: loc.tabBookings,
        routeName: RouteNames.bookings,
        iconAsset: 'assets/icons/ic_reservation.png',
      ),
      ShellTabItem(
        label: loc.tabGuests,
        routeName: RouteNames.guests,
        iconAsset: 'assets/icons/ic_guests.png',
      ),
      ShellTabItem(
        label: loc.tabProfile,
        routeName: RouteNames.settings,
        iconAsset: 'assets/icons/ic_profile.png',
      ),
    ];
  }
}
