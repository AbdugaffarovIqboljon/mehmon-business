import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/config/env.dart';
import 'package:mehmon/core/routing/app_router.dart';
import 'package:mehmon/core/theme/app_theme.dart';
import 'package:mehmon/features/auth/presentation/controllers/auth_controller.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

      runApp(const ProviderScope(child: MehmonApp()));
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
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authStateListenable = ValueNotifier<bool>(false);
    _router = appRouter(authStateListenable: _authStateListenable);
  }

  @override
  void dispose() {
    _router.dispose();
    _authStateListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isAuthenticated = authState.asData?.value != null;
    if (_authStateListenable.value != isAuthenticated) {
      _authStateListenable.value = isAuthenticated;
    }

    return MaterialApp.router(
      title: 'Mehmon',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: _router,
    );
  }
}
