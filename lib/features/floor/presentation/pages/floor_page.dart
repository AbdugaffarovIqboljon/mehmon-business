import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/widgets/app_error_view.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/models/floor_drawer_destination.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_drawer.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_map_canvas.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_timeline_header.dart';
import 'package:mehmon/features/floor/presentation/widgets/table_form_sheet.dart';
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

  late final ValueNotifier<int> _selectedMinuteNotifier;
  Timer? _liveTickTimer;

  late final AnimationController _snapController;

  @override
  void initState() {
    super.initState();
    _selectedMinuteNotifier = ValueNotifier<int>(_currentMinute);
    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _liveTickTimer = Timer.periodic(
      const Duration(seconds: 60),
      (_) {
        if (!mounted) return;
        if (ref.read(selectedTimelineProvider) == null) {
          _selectedMinuteNotifier.value = _currentMinute;
        }
      },
    );
  }

  static int get _currentMinute {
    final now = DateTime.now();
    return now.hour * 60 + now.minute;
  }

  @override
  void dispose() {
    _liveTickTimer?.cancel();
    _snapController.dispose();
    _selectedMinuteNotifier.dispose();
    super.dispose();
  }

  // ── Snap-to-now ─────────────────────────────────────────────────────────

  void _snapToNow() {
    final from = _selectedMinuteNotifier.value;
    final to = _currentMinute;
    if (from == to) return;

    _snapController.reset();
    final animation = IntTween(begin: from, end: to).animate(
      CurvedAnimation(parent: _snapController, curve: Curves.easeInOut),
    );
    animation.addListener(() {
      _selectedMinuteNotifier.value = animation.value;
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
    _selectedMinuteNotifier.value = minute;
  }

  void _onLivePressed() {
    _selectedMinuteNotifier.value = _currentMinute;
    _snapToNow();
  }

  // ── Edit mode ────────────────────────────────────────────────────────────

  void _enterEditMode() {
    ref.read(floorEditModeProvider.notifier).state = true;
  }

  void _cancelEdit() {
    ref
      ..read(pendingPositionsProvider.notifier).state = {}
      ..read(pendingRotationsProvider.notifier).state = {}
      ..read(floorEditModeProvider.notifier).state = false;
  }

  /// Flushes pending rotation changes back to the server. Positions are
  /// already persisted per-drag via _confirmAndSave in the canvas.
  Future<void> _saveAllPositions() async {
    final pendingRot = ref.read(pendingRotationsProvider);
    if (pendingRot.isEmpty) {
      ref.read(floorEditModeProvider.notifier).state = false;
      return;
    }

    final tables =
        ref.read(floorControllerProvider).valueOrNull ?? const <FloorEntity>[];
    final byId = {for (final t in tables) t.id: t};

    final controller = ref.read(floorControllerProvider.notifier);
    for (final id in pendingRot.keys) {
      final entity = byId[id];
      if (entity == null) continue;
      await controller.updateTablePosition(
        id,
        entity.x,
        entity.y,
        rotation: pendingRot[id],
      );
    }

    ref
      ..read(pendingRotationsProvider.notifier).state = {}
      ..read(floorEditModeProvider.notifier).state = false;
  }

  Widget _buildFloatingActions() {
    final isEditing = ref.watch(floorEditModeProvider);
    if (isEditing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'cancel_edit',
            backgroundColor: AppColors.error,
            onPressed: _cancelEdit,
            child: const Icon(Icons.close),
          ),
          const SizedBox(width: 12),
          FloatingActionButton.extended(
            heroTag: 'save_edit',
            onPressed: _saveAllPositions,
            icon: const Icon(Icons.save),
            label: const Text('Saqlash'),
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'edit_mode',
          mini: true,
          onPressed: _enterEditMode,
          child: const Icon(Icons.edit),
        ),
        const SizedBox(height: 12),
        FloatingActionButton(
          heroTag: 'add_table',
          onPressed: () => showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (_) => const TableFormSheet(),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
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
      floatingActionButton: _buildFloatingActions(),
      body: Column(
        children: [
          FloorTimelineHeader(
            minuteNotifier: _selectedMinuteNotifier,
            onTimeChanged: _onTimeChanged,
            onMenuTap: _openDrawer,
            onTimeTap: _snapToNow,
            onLivePressed: _onLivePressed,
          ),
          Expanded(
            child: tablesAsync.when(
              skipLoadingOnReload: true,
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => AppErrorView(
                error: e,
                onRetry: () => ref.invalidate(floorControllerProvider),
              ),
              data: (tables) => FloorMapCanvas(tables: tables),
            ),
          ),
        ],
      ),
    );
  }
}
