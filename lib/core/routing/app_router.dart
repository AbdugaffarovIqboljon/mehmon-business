// lib/core/routing/app_router.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/features/auth/presentation/pages/intro_page.dart';
import 'package:mehmon/features/auth/presentation/pages/language_select_page.dart';
import 'package:mehmon/features/auth/presentation/pages/login_page.dart';
import 'package:mehmon/features/auth/presentation/pages/register_page.dart';
import 'package:mehmon/features/auth/presentation/pages/restaurant_profile_page.dart';
import 'package:mehmon/features/bookings/presentation/pages/bookings_page.dart';
import 'package:mehmon/features/floor/presentation/pages/chronology_page.dart';
import 'package:mehmon/features/floor/presentation/pages/dashboard_page.dart';
import 'package:mehmon/features/floor/presentation/pages/floor_page.dart';
import 'package:mehmon/features/floor/presentation/pages/floor_placeholder_page.dart';
import 'package:mehmon/features/floor/presentation/pages/shifts_page.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/presentation/pages/guest_detail_page.dart';
import 'package:mehmon/features/guests/presentation/pages/guests_page.dart';
import 'package:mehmon/features/settings/presentation/pages/about_us_page.dart';
import 'package:mehmon/features/settings/presentation/pages/edit_profile_page.dart';
import 'package:mehmon/features/settings/presentation/pages/settings_page.dart';
import 'package:mehmon/features/shell/presentation/pages/main_shell_page.dart';
import 'package:mehmon/features/stats/presentation/pages/statistics_page.dart';
import 'package:mehmon/l10n/app_localizations.dart';

GoRouter appRouter({required ValueListenable<bool> authStateListenable}) {
  return GoRouter(
    initialLocation: RoutePaths.languageSelect,
    debugLogDiagnostics: true,
    refreshListenable: authStateListenable,

    redirect: (BuildContext context, GoRouterState state) {
      final isAuthenticated = authStateListenable.value;
      final guestOnlyRoute =
          state.matchedLocation == RoutePaths.login ||
          state.matchedLocation == RoutePaths.onboarding ||
          state.matchedLocation == RoutePaths.languageSelect;
      final registrationFlowRoute =
          state.matchedLocation == RoutePaths.register ||
          state.matchedLocation == RoutePaths.profileSetup;
      final authFlowRoute = guestOnlyRoute || registrationFlowRoute;

      if (!isAuthenticated && !authFlowRoute) return RoutePaths.login;
      if (isAuthenticated && guestOnlyRoute) return RoutePaths.floor;
      return null;
    },

    routes: [
      // ── Auth Routes ──────────────────────────────────────────────
      GoRoute(
        name: RouteNames.languageSelect,
        path: RoutePaths.languageSelect,
        builder: (context, state) => const LanguageSelectPage(),
      ),
      GoRoute(
        name: RouteNames.onboarding,
        path: RoutePaths.onboarding,
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        name: RouteNames.login,
        path: RoutePaths.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: RouteNames.register,
        path: RoutePaths.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        name: RouteNames.profileSetup,
        path: RoutePaths.profileSetup,
        builder: (context, state) => const RestaurantProfilePage(),
      ),

      // ── Floor Drawer Routes (no shell) ───────────────────────────
      GoRoute(
        name: RouteNames.floorDashboard,
        path: RoutePaths.floorDashboard,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        name: RouteNames.floorChronology,
        path: RoutePaths.floorChronology,
        builder: (context, state) => const ChronologyPage(),
      ),
      GoRoute(
        name: RouteNames.floorReports,
        path: RoutePaths.floorReports,
        builder: (context, state) => const StatisticsPage(),
      ),
      GoRoute(
        name: RouteNames.floorShifts,
        path: RoutePaths.floorShifts,
        builder: (context, state) => const ShiftsPage(),
      ),
      GoRoute(
        name: RouteNames.floorPosIntegration,
        path: RoutePaths.floorPosIntegration,
        builder: (context, state) => FloorPlaceholderPage(
          title: AppLocalizations.of(context)!.drawerPosIntegration,
        ),
      ),
      GoRoute(
        name: RouteNames.floorMenuSettings,
        path: RoutePaths.floorMenuSettings,
        builder: (context, state) => FloorPlaceholderPage(
          title: AppLocalizations.of(context)!.drawerSettings,
        ),
      ),

      // ── Detail Routes (outside shell → NO navbar) ────────────────
      GoRoute(
        name: RouteNames.guestDetail,
        path: RoutePaths.guestDetail,
        builder: (context, state) {
          final extra = state.extra;
          final initialGuest = extra is GuestEntity ? extra : null;
          final guestId = state.pathParameters[RouteParams.guestId] ?? '';
          return GuestDetailPage(guestId: guestId, initialGuest: initialGuest);
        },
      ),
      GoRoute(
        name: RouteNames.editProfile,
        path: RoutePaths.editProfile,
        builder: (context, state) {
          final extra = state.extra;
          final initialData = extra is EditProfileInitialData
              ? extra
              : const EditProfileInitialData();
          return EditProfilePage(initialData: initialData);
        },
      ),
      GoRoute(
        name: RouteNames.aboutUs,
        path: RoutePaths.aboutUs,
        builder: (context, state) => const AboutUsPage(),
      ),

      // ── Main App Shell (with navbar) ─────────────────────────────
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShellPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.floor,
                path: RoutePaths.floor,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: FloorPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.bookings,
                path: RoutePaths.bookings,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BookingsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.guests,
                path: RoutePaths.guests,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: GuestsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.settings,
                path: RoutePaths.settings,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsPage()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
