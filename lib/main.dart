import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/config/env.dart';
import 'package:mehmon/core/routing/app_router.dart';
import 'package:mehmon/core/theme/app_theme.dart';
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
class MehmonApp extends StatelessWidget {
  const MehmonApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(auth): Replace with actual auth state from AuthController.
    final router = appRouter(isAuthenticated: false);

    return MaterialApp.router(
      title: 'Mehmon',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
