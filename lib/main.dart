import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/config/env.dart';
import 'package:mehmon/core/local/locale_provider.dart';
import 'package:mehmon/core/local/shared_prefs_provider.dart';
import 'package:mehmon/core/networking/dio_client.dart';
import 'package:mehmon/core/routing/app_router.dart';
import 'package:mehmon/core/theme/app_theme.dart';
import 'package:mehmon/features/auth/presentation/controllers/auth_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final prefs = await SharedPreferences.getInstance();

  // ── Sentry ──────────────────────────────────────────────────────────
  await SentryFlutter.init(
    (options) {
      options
        ..dsn = Env.sentryDsn
        ..tracesSampleRate = 1.0
        ..environment = Env.isProduction ? 'production' : 'development';
    },
    appRunner: () {
      // Catch uncaught Flutter errors.
      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        unawaited(
          Sentry.captureException(details.exception, stackTrace: details.stack),
        );
      };

      runApp(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(prefs),
            onLogoutProvider.overrideWith((ref) {
              var logoutInFlight = false;
              return () {
                if (logoutInFlight) return;
                logoutInFlight = true;
                unawaited(
                  ref
                      .read(authControllerProvider.notifier)
                      .logout()
                      .whenComplete(() => logoutInFlight = false),
                );
              };
            }),
          ],
          child: const MehmonApp(),
        ),
      );
    },
  );
}

/// Root application widget.
class MehmonApp extends ConsumerStatefulWidget {
  const MehmonApp({super.key});

  @override
  ConsumerState<MehmonApp> createState() => _MehmonAppState();
}

class _MehmonAppState extends ConsumerState<MehmonApp> {
  late final ValueNotifier<bool> _authStateListenable;
  late final ValueNotifier<bool> _authLoadedListenable;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authStateListenable = ValueNotifier<bool>(false);
    _authLoadedListenable = ValueNotifier<bool>(false);
    _router = appRouter(
      authStateListenable: _authStateListenable,
    );
    _authLoadedListenable.addListener(_router.refresh);
  }

  @override
  void dispose() {
    _authLoadedListenable.removeListener(_router.refresh);
    _router.dispose();
    _authStateListenable.dispose();
    _authLoadedListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final currentLocale = ref.watch(localeProvider);
    final isAuthenticated = authState.asData?.value != null;
    if (_authStateListenable.value != isAuthenticated) {
      debugPrint('🔔 LISTENABLE | isAuthenticated=$isAuthenticated | '
          'prev=${_authStateListenable.value}');
      _authStateListenable.value = isAuthenticated;
    }

    // Fire once when auth loading completes — covers the
    // AsyncLoading→AsyncData(null) case where isAuthenticated
    // stays false and _authStateListenable never fires.
    if (!authState.isLoading && !_authLoadedListenable.value) {
      _authLoadedListenable.value = true;
    }

    return MaterialApp.router(
      title: 'Mehmon',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: _router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: currentLocale,
    );
  }
}
