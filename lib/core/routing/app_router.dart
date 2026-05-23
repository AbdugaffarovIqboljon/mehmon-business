// lib/core/routing/app_router.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/local/shared_prefs_provider.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mehmon/features/auth/presentation/pages/intro_page.dart';
import 'package:mehmon/features/auth/presentation/pages/language_select_page.dart';
import 'package:mehmon/features/auth/presentation/pages/login_page.dart';
import 'package:mehmon/features/auth/presentation/pages/register_page.dart';
import 'package:mehmon/features/auth/presentation/pages/restaurant_profile_page.dart';
import 'package:mehmon/features/auth/presentation/pages/restaurant_setup_page.dart';
import 'package:mehmon/features/auth/presentation/pages/splash_page.dart';
import 'package:mehmon/features/bookings/presentation/pages/bookings_page.dart';
import 'package:mehmon/features/floor/presentation/pages/chronology_page.dart';
import 'package:mehmon/features/floor/presentation/pages/dashboard_page.dart';
import 'package:mehmon/features/floor/presentation/pages/floor_page.dart';
import 'package:mehmon/features/floor/presentation/pages/floor_placeholder_page.dart';
import 'package:mehmon/features/floor/presentation/pages/shifts_page.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';
import 'package:mehmon/features/guests/presentation/pages/guest_detail_page.dart';
import 'package:mehmon/features/guests/presentation/pages/guests_page.dart';
import 'package:mehmon/features/settings/domain/entities/profile_entity.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';
import 'package:mehmon/features/settings/presentation/pages/about_us_page.dart';
import 'package:mehmon/features/settings/presentation/pages/edit_profile_page.dart';
import 'package:mehmon/features/settings/presentation/pages/settings_page.dart';
import 'package:mehmon/features/shell/presentation/pages/main_shell_page.dart';
import 'package:mehmon/features/stats/presentation/pages/statistics_page.dart';
import 'package:mehmon/l10n/app_localizations.dart';

// Listens to profileControllerProvider and notifies GoRouter to re-run redirect
// whenever profile state changes (e.g. after the async fetch completes post-login).
class _ProfileRefreshNotifier extends ChangeNotifier {
  bool _attached = false;
  ProviderSubscription<AsyncValue<ProfileEntity?>>? _subscription;

  void attachIfNeeded(BuildContext context) {
    // Only subscribe to profile when authenticated. Prevents the cold-start
    // profile fetch from firing with no token and triggering the 401 path.
    final container = ProviderScope.containerOf(context);
    final isAuthenticated =
        container.read(authControllerProvider).valueOrNull != null;
    if (!isAuthenticated) return;

    if (_attached) return;
    _attached = true;
    _subscription = container.listen(
      profileControllerProvider,
      (AsyncValue<ProfileEntity?>? prev, AsyncValue<ProfileEntity?> next) {
        if (prev?.valueOrNull == null && next.valueOrNull != null) {
          notifyListeners();
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription?.close();
    super.dispose();
  }
}

GoRouter appRouter({required ValueListenable<bool> authStateListenable}) {
  final profileRefresh = _ProfileRefreshNotifier();

  return GoRouter(
    initialLocation: RoutePaths.splash,
    debugLogDiagnostics: true,
    refreshListenable: Listenable.merge([authStateListenable, profileRefresh]),

    redirect: (BuildContext context, GoRouterState state) {
      profileRefresh.attachIfNeeded(context);

      final container = ProviderScope.containerOf(context, listen: false);
      final authState = container.read(authControllerProvider);
      final location = state.matchedLocation;

      debugPrint('🔀 REDIRECT | location=$location | '
          'isLoading=${authState.isLoading} | '
          'isAuth=${authState.asData?.value != null}');

      // While auth is restoring from disk — park on the neutral splash route
      // (visually identical to the native splash) to avoid flashing
      // language-select / login / etc. before we know where to go.
      if (authState.isLoading) {
        return location == RoutePaths.splash ? null : RoutePaths.splash;
      }

      final isAuthenticated = authState.valueOrNull != null;

      final prefs = container.read(sharedPreferencesProvider);
      final hasLang = prefs.getBool(kHasSelectedLanguage) ?? false;
      final hasOnboarding = prefs.getBool(kHasSeenOnboarding) ?? false;

      // A. No language picked → go to language-select.
      if (!hasLang) {
        return location == RoutePaths.languageSelect
            ? null
            : RoutePaths.languageSelect;
      }

      // B. Language picked but onboarding not seen → go to onboarding.
      if (!hasOnboarding) {
        return location == RoutePaths.onboarding
            ? null
            : RoutePaths.onboarding;
      }

      // C. Onboarding done but not authenticated → restrict to auth flow.
      if (!isAuthenticated) {
        const authFlow = {
          RoutePaths.login,
          RoutePaths.register,
          RoutePaths.profileSetup,
        };
        return authFlow.contains(location) ? null : RoutePaths.login;
      }

      // D. Authenticated but profile incomplete → /profile-setup.
      final isProfileSetup = location == RoutePaths.profileSetup;
      final isRegister = location == RoutePaths.register;
      // Never redirect away from edit-profile — user is actively fixing their
      // profile, and the refresh from updateProfile would cancel their pop.
      final isEditProfile = location == RoutePaths.editProfile;
      final isRestaurantSetup = location == RoutePaths.restaurantSetup;
      if (!isProfileSetup && !isRegister && !isEditProfile) {
        final profile =
            container.read(profileControllerProvider).valueOrNull;
        if (profile != null &&
            (profile.institutionType == null ||
                profile.address == null ||
                profile.address!.trim().isEmpty)) {
          return RoutePaths.profileSetup;
        }
      }

      // E. Authenticated & profile complete but restaurant setup pending →
      // /restaurant-setup. Excluding the setup route itself prevents a
      // redirect loop.
      if (!isProfileSetup &&
          !isRegister &&
          !isEditProfile &&
          !isRestaurantSetup) {
        final profile =
            container.read(profileControllerProvider).valueOrNull;
        if (profile != null && !profile.isSetupCompleted) {
          return RoutePaths.restaurantSetup;
        }
      }

      // F. Setup already completed — bounce away from the setup route.
      if (isRestaurantSetup) {
        final profile =
            container.read(profileControllerProvider).valueOrNull;
        if (profile != null && profile.isSetupCompleted) {
          return RoutePaths.floor;
        }
      }

      // G. Authenticated & complete — bounce away from guest-only routes.
      const guestOnly = {
        RoutePaths.languageSelect,
        RoutePaths.onboarding,
        RoutePaths.login,
      };
      if (guestOnly.contains(location)) return RoutePaths.floor;

      // H. Auth resolved and still parked on splash — route to destination.
      if (location == RoutePaths.splash) {
        if (!hasLang) return RoutePaths.languageSelect;
        if (!hasOnboarding) return RoutePaths.onboarding;
        if (!isAuthenticated) return RoutePaths.login;
        return RoutePaths.floor;
      }

      return null;
    },

    routes: [
      // ── Auth Routes ──────────────────────────────────────────────
      GoRoute(
        name: RouteNames.splash,
        path: RoutePaths.splash,
        builder: (context, state) => const SplashPage(),
      ),
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
      GoRoute(
        name: RouteNames.restaurantSetup,
        path: RoutePaths.restaurantSetup,
        builder: (context, state) => const RestaurantSetupPage(),
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
