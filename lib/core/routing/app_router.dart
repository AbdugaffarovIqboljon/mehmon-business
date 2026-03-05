import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/features/auth/presentation/pages/login_page.dart';
import 'package:mehmon/features/auth/presentation/pages/register_page.dart';
import 'package:mehmon/features/bookings/presentation/pages/bookings_page.dart';
import 'package:mehmon/features/floor/presentation/pages/floor_page.dart';
import 'package:mehmon/features/guests/presentation/pages/guests_page.dart';
import 'package:mehmon/features/settings/presentation/pages/settings_page.dart';
import 'package:mehmon/features/stats/presentation/pages/stats_page.dart';

/// Application router configuration.
///
/// Uses go_router with named routes and an auth redirect guard.
GoRouter appRouter({required bool isAuthenticated}) {
  return GoRouter(
    initialLocation: RoutePaths.login,
    debugLogDiagnostics: true,

    // ── Auth Redirect Guard ──────────────────────────────────────────
    redirect: (BuildContext context, GoRouterState state) {
      final loggingIn =
          state.matchedLocation == RoutePaths.login ||
          state.matchedLocation == RoutePaths.register ||
          state.matchedLocation == RoutePaths.onboarding;

      // Not authenticated → force to login.
      if (!isAuthenticated && !loggingIn) {
        return RoutePaths.login;
      }

      // Authenticated but on a login/register page → go to floor.
      if (isAuthenticated && loggingIn) {
        return RoutePaths.floor;
      }

      // No redirect.
      return null;
    },

    routes: [
      // ── Auth Routes ──────────────────────────────────────────────
      GoRoute(
        name: RouteNames.onboarding,
        path: RoutePaths.onboarding,
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Onboarding — coming soon')),
        ),
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
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Profile Setup — coming soon')),
        ),
      ),

      // ── Main App Routes ──────────────────────────────────────────
      GoRoute(
        name: RouteNames.floor,
        path: RoutePaths.floor,
        builder: (context, state) => const FloorPage(),
      ),
      GoRoute(
        name: RouteNames.bookings,
        path: RoutePaths.bookings,
        builder: (context, state) => const BookingsPage(),
      ),
      GoRoute(
        name: RouteNames.guests,
        path: RoutePaths.guests,
        builder: (context, state) => const GuestsPage(),
      ),
      GoRoute(
        name: RouteNames.stats,
        path: RoutePaths.stats,
        builder: (context, state) => const StatsPage(),
      ),
      GoRoute(
        name: RouteNames.settings,
        path: RoutePaths.settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
