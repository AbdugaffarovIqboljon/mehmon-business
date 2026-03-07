import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/models/floor_drawer_destination.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_drawer.dart';

class FloorPage extends StatefulWidget {
  const FloorPage({super.key});

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FloorDrawerDestination? _pendingDestination;
  bool _isNavigatingFromDrawer = false;

  void _openDrawer() => _scaffoldKey.currentState?.openDrawer();

  void _onDestinationTap(FloorDrawerDestination destination) {
    if (_isNavigatingFromDrawer) return;
    _pendingDestination = destination;
    Navigator.of(context).pop();
  }

  Future<void> _pushDrawerDestination(
      FloorDrawerDestination destination) async {
    _isNavigatingFromDrawer = true;
    try {
      await context.pushNamed(destination.routeName);
    } finally {
      _isNavigatingFromDrawer = false;
    }

    if (!mounted) return;
    _openDrawer();
  }

  void _onDrawerChanged(bool isOpened) {
    if (isOpened || _pendingDestination == null || _isNavigatingFromDrawer) {
      return;
    }
    final destination = _pendingDestination!;
    _pendingDestination = null;
    unawaited(_pushDrawerDestination(destination));
  }

  void _showNotReadyMessage(String text) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.scaffold,
      drawerEdgeDragWidth: MediaQuery.sizeOf(context).width * 0.2,
      drawerScrimColor: Colors.black.withValues(alpha: 0.26),
      onDrawerChanged: _onDrawerChanged,
      drawer: FloorDrawer(
        onDestinationTap: _onDestinationTap,
        onSupportTap: () =>
            _showNotReadyMessage('Поддержка скоро будет доступна'),
        onLogoutTap: () =>
            _showNotReadyMessage('Выход будет реализован на следующем шаге'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      onTap: _openDrawer,
                      borderRadius: BorderRadius.circular(14),
                      splashFactory: NoSplash.splashFactory,
                      overlayColor:
                          WidgetStateProperty.resolveWith<Color?>((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return AppColors.primary.withValues(alpha: 0.1);
                        }
                        if (states.contains(WidgetState.hovered) ||
                            states.contains(WidgetState.focused)) {
                          return AppColors.primary.withValues(alpha: 0.05);
                        }
                        return null;
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        child: Image.asset(
                          'assets/icons/ic_menu.png',
                          width: 30,
                          height: 30,
                          color: AppColors.textSecondary,
                          filterQuality: FilterQuality.low,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Карта зала',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              const Expanded(
                child: Center(
                  child: Text('Страница зала'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
