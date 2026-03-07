import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/features/auth/presentation/pages/intro_page.dart';
import 'package:mehmon/features/auth/presentation/pages/login_page.dart';
import 'package:mehmon/features/auth/presentation/pages/register_page.dart';
import 'package:mehmon/features/auth/presentation/pages/restaurant_profile_page.dart';
import 'package:mehmon/features/bookings/presentation/pages/bookings_page.dart';
import 'package:mehmon/features/floor/presentation/pages/floor_page.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/presentation/pages/guest_detail_page.dart';
import 'package:mehmon/features/guests/presentation/pages/guests_page.dart';
import 'package:mehmon/features/settings/presentation/pages/settings_page.dart';
import 'package:mehmon/features/shell/presentation/pages/main_shell_page.dart';

/// Application router configuration.
///
/// Uses go_router with named routes and an auth redirect guard.
GoRouter appRouter({required ValueListenable<bool> authStateListenable}) {
  return GoRouter(
    initialLocation: RoutePaths.onboarding,
    debugLogDiagnostics: true,
    refreshListenable: authStateListenable,

    // ── Auth Redirect Guard ──────────────────────────────────────────
    redirect: (BuildContext context, GoRouterState state) {
      final isAuthenticated = authStateListenable.value;
      final guestOnlyRoute = state.matchedLocation == RoutePaths.login ||
          state.matchedLocation == RoutePaths.onboarding;
      final registrationFlowRoute =
          state.matchedLocation == RoutePaths.register ||
              state.matchedLocation == RoutePaths.profileSetup;
      final authFlowRoute = guestOnlyRoute || registrationFlowRoute;

      // Not authenticated → force to login.
      if (!isAuthenticated && !authFlowRoute) {
        return RoutePaths.login;
      }

      // Authenticated but on guest-only pages → go to floor.
      if (isAuthenticated && guestOnlyRoute) {
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

      // ── Main App Shell Routes ────────────────────────────────────
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellPage(navigationShell: navigationShell);
        },
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
                routes: [
                  GoRoute(
                    name: RouteNames.guestDetail,
                    path: RoutePaths.guestDetail,
                    builder: (context, state) {
                      final extra = state.extra;
                      final initialGuest =
                          extra is GuestEntity ? extra : null;
                      final guestId =
                          state.pathParameters[RouteParams.guestId] ?? '';
                      return GuestDetailPage(
                        guestId: guestId,
                        initialGuest: initialGuest,
                      );
                    },
                  ),
                ],
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
