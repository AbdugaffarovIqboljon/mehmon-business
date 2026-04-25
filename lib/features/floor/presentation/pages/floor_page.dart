import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/models/floor_drawer_destination.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_drawer.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_map_canvas.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_timeline_header.dart';
import 'package:mehmon/l10n/app_localizations.dart';

/// Main floor page showing the restaurant hall layout with an
/// interactive timeline ruler at the top.
class FloorPage extends ConsumerStatefulWidget {
  const FloorPage({super.key});

  @override
  ConsumerState<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends ConsumerState<FloorPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FloorDrawerDestination? _pendingDestination;
  bool _isNavigatingFromDrawer = false;

  late int _selectedMinute = _currentMinute;

  late final AnimationController _snapController;

  @override
  void initState() {
    super.initState();
    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  static int get _currentMinute {
    final now = DateTime.now();
    return now.hour * 60 + now.minute;
  }

  @override
  void dispose() {
    _snapController.dispose();
    super.dispose();
  }

  // ── Snap-to-now ─────────────────────────────────────────────────────────

  void _snapToNow() {
    final from = _selectedMinute;
    final to = _currentMinute;
    if (from == to) return;

    _snapController.reset();
    final animation = IntTween(begin: from, end: to).animate(
      CurvedAnimation(parent: _snapController, curve: Curves.easeInOut),
    );
    animation.addListener(() {
      setState(() => _selectedMinute = animation.value);
    });
    _snapController.forward();
  }

  // ── Drawer logic ─────────────────────────────────────────────────────────

  void _openDrawer() => _scaffoldKey.currentState?.openDrawer();

  void _onDestinationTap(FloorDrawerDestination destination) {
    if (_isNavigatingFromDrawer) return;
    _pendingDestination = destination;
    Navigator.of(context).pop();
  }

  Future<void> _pushDrawerDestination(
    FloorDrawerDestination destination,
  ) async {
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
        SnackBar(content: Text(text), behavior: SnackBarBehavior.floating),
      );
  }

  // ── Timeline ─────────────────────────────────────────────────────────────

  void _onTimeChanged(int minute) {
    if (_snapController.isAnimating) _snapController.stop();
    setState(() => _selectedMinute = minute);
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final tablesAsync = ref.watch(floorControllerProvider);

    return Scaffold(
      key: _scaffoldKey,
      drawerEdgeDragWidth: MediaQuery.sizeOf(context).width * 0.2,
      drawerScrimColor: Colors.black.withValues(alpha: 0.26),
      onDrawerChanged: _onDrawerChanged,
      drawer: FloorDrawer(
        onDestinationTap: _onDestinationTap,
        onSupportTap: () => _showNotReadyMessage(
          AppLocalizations.of(context)!.supportComingSoon,
        ),
        onLogoutTap: () => _showNotReadyMessage(
          AppLocalizations.of(context)!.logOutImplNextStep,
        ),
      ),
      body: Column(
        children: [
          FloorTimelineHeader(
            selectedMinute: _selectedMinute,
            onTimeChanged: _onTimeChanged,
            onMenuTap: _openDrawer,
            onTimeTap: _snapToNow,
          ),
          Expanded(
            child: tablesAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text(e.toString())),
              data: (tables) => FloorMapCanvas(tables: tables),
            ),
          ),
        ],
      ),
    );
  }
}
