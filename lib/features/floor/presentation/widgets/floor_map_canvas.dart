import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/models/floor_table_config.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_table_widget.dart';
import 'package:mehmon/features/floor/presentation/widgets/table_detail_sheet.dart';

/// Floor map canvas: pan/zoomable 2000×2000 surface with absolute pixel-
/// positioned tables on a [Stack].
///
/// Tables with non-zero `x` or `y` render at their saved coordinates; the
/// rest fall into a 3-column auto-layout grid. Drag positions live in
/// per-table [ValueNotifier]s so only the dragged table rebuilds, and are
/// clamped into the canvas bounds. Manager-driven drag updates are debounced
/// 500ms after the last movement and persisted via the floor controller.
class FloorMapCanvas extends ConsumerStatefulWidget {
  const FloorMapCanvas({this.tables, super.key});

  final List<FloorEntity>? tables;

  @override
  ConsumerState<FloorMapCanvas> createState() => _FloorMapCanvasState();
}

class _FloorMapCanvasState extends ConsumerState<FloorMapCanvas> {
  static const double kCanvasWidth = 2000;
  static const double kCanvasHeight = 2000;
  static const double kTableSize = 100;

  static const int _gridColumns = 3;
  static const double _gridSpacing = 140;
  static const double _gridMargin = 20;
  static const double _tableSmall = 100;
  static const double _tableLarge = 140;

  late final ValueNotifier<String?> _selectedTableNotifier;
  final Map<String, ValueNotifier<Offset>> _positionNotifiers = {};
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _selectedTableNotifier = ValueNotifier<String?>(null);
  }

  @override
  void didUpdateWidget(covariant FloorMapCanvas oldWidget) {
    super.didUpdateWidget(oldWidget);
    final liveIds = (widget.tables ?? const <FloorEntity>[])
        .map((e) => e.id)
        .toSet();
    final stale = _positionNotifiers.keys
        .where((id) => !liveIds.contains(id))
        .toList(growable: false);
    for (final id in stale) {
      _positionNotifiers.remove(id)?.dispose();
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _selectedTableNotifier.dispose();
    for (final n in _positionNotifiers.values) {
      n.dispose();
    }
    _positionNotifiers.clear();
    super.dispose();
  }

  void _onTableTap(BuildContext context, FloorEntity entity) {
    _selectedTableNotifier.value = entity.id;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => TableDetailSheet(
        tableId: entity.id,
        tableNumber: entity.number,
      ),
    );
  }

  Offset _autoLayoutPosition(int index) {
    final col = index % _gridColumns;
    final row = index ~/ _gridColumns;
    return Offset(
      col * _gridSpacing + _gridMargin,
      row * _gridSpacing + _gridMargin,
    );
  }

  Offset _initialPositionFor(FloorEntity entity, int index, double tableW) {
    final hasPosition = entity.x != 0 || entity.y != 0;
    final raw = hasPosition
        ? Offset(entity.x, entity.y)
        : _autoLayoutPosition(index);
    return _clampToCanvas(raw, tableW);
  }

  Offset _clampToCanvas(Offset o, double tableW) {
    final maxX = (kCanvasWidth - tableW).clamp(0.0, kCanvasWidth);
    final maxY = (kCanvasHeight - kTableSize).clamp(0.0, kCanvasHeight);
    return Offset(o.dx.clamp(0.0, maxX), o.dy.clamp(0.0, maxY));
  }

  ValueNotifier<Offset> _notifierFor(
    FloorEntity entity,
    int index,
    double tableW,
  ) {
    return _positionNotifiers.putIfAbsent(
      entity.id,
      () => ValueNotifier<Offset>(_initialPositionFor(entity, index, tableW)),
    );
  }

  double _tableWidthFor(FloorEntity entity) =>
      entity.capacity >= 5 ? _tableLarge : _tableSmall;

  String? _labelFor(FloorEntity entity) {
    final zone = entity.zone?.trim();
    if (zone != null && zone.isNotEmpty) return zone;
    final loc = entity.location.trim();
    if (loc.isNotEmpty) return loc;
    return null;
  }

  void _onPanStart(DragStartDetails _) {
    _debounceTimer?.cancel();
  }

  void _onPanUpdate(
    ValueNotifier<Offset> notifier,
    double tableW,
    DragUpdateDetails details,
  ) {
    notifier.value = _clampToCanvas(notifier.value + details.delta, tableW);
  }

  void _onPanEnd(FloorEntity entity, ValueNotifier<Offset> notifier) {
    final pos = notifier.value;
    _debounceTimer?.cancel();
    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () => ref
          .read(floorControllerProvider.notifier)
          .updateTablePosition(entity.id, pos.dx, pos.dy),
    );
  }

  @override
  Widget build(BuildContext context) {
    final entities = widget.tables ?? const <FloorEntity>[];

    if (entities.isEmpty) {
      return const ColoredBox(
        color: AppColors.floorCanvasBg,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.table_restaurant_outlined,
                size: 64,
                color: AppColors.textHint,
              ),
              SizedBox(height: 12),
              Text(
                "Hali stollar qo'shilmagan",
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
      );
    }

    final selectedTime = ref.watch(selectedTimelineProvider);
    final bookings = ref.watch(bookingControllerProvider).valueOrNull ??
        const <BookingEntity>[];

    return ColoredBox(
      color: AppColors.floorCanvasBg,
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(200),
        minScale: 0.4,
        maxScale: 2,
        constrained: false,
        child: SizedBox(
          width: kCanvasWidth,
          height: kCanvasHeight,
          child: Stack(
            children: [
              for (var i = 0; i < entities.length; i++)
                _buildTable(
                  entities[i],
                  i,
                  _statusFor(entities[i], selectedTime, bookings),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTable(FloorEntity entity, int index, String? displayStatus) {
    final tableW = _tableWidthFor(entity);
    final notifier = _notifierFor(entity, index, tableW);
    final config = FloorTableConfig.fromEntity(
      entity,
      index: index,
      useAutoLayout: false,
    );
    final label = _labelFor(entity);

    return ValueListenableBuilder<Offset>(
      key: ValueKey<String>(entity.id),
      valueListenable: notifier,
      builder: (_, pos, child) => Positioned(
        left: pos.dx,
        top: pos.dy,
        width: tableW,
        child: child!,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: _onPanStart,
        onPanUpdate: (d) => _onPanUpdate(notifier, tableW, d),
        onPanEnd: (_) => _onPanEnd(entity, notifier),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloorTableWidget(
              config: config,
              displayStatus: displayStatus,
              selectedNotifier: _selectedTableNotifier,
              onTap: () => _onTableTap(context, entity),
            ),
            if (label != null) ...[
              const SizedBox(height: 2),
              _ZoneBadge(label: label),
            ],
          ],
        ),
      ),
    );
  }

  String? _statusFor(
    FloorEntity entity,
    TimeOfDay? selectedTime,
    List<BookingEntity> bookings,
  ) {
    if (selectedTime == null) return entity.status;
    return _computeStatusAtTime(
      tableId: entity.id,
      bookings: bookings,
      time: selectedTime,
    );
  }
}

class _ZoneBadge extends StatelessWidget {
  const _ZoneBadge({required this.label});

  final String label;

  static const _zoneColors = <Color>[
    Color(0xFF3498DB),
    Color(0xFF2ECC71),
    Color(0xFFE67E22),
    Color(0xFF9B59B6),
    Color(0xFF1ABC9C),
    Color(0xFFE74C3C),
  ];

  static Color _colorFor(String s) =>
      _zoneColors[s.hashCode.abs() % _zoneColors.length];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: _colorFor(label),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

// ── Pure helpers (top-level, no closures) ───────────────────────────────────

String _computeStatusAtTime({
  required String tableId,
  required List<BookingEntity> bookings,
  required TimeOfDay time,
}) {
  final selectedMin = time.hour * 60 + time.minute;

  for (final b in bookings) {
    if (b.status == 'cancelled') continue;

    final bTableId = b.tableInfo?.id;
    if (bTableId != tableId) continue;

    final startParts = b.timeSlot.split(':');
    if (startParts.length < 2) continue;
    final startMin = (int.tryParse(startParts[0]) ?? 0) * 60 +
        (int.tryParse(startParts[1]) ?? 0);

    final endMin =
        b.endTime != null ? _parseTimeToMin(b.endTime!) : startMin + 120;

    if (selectedMin >= startMin && selectedMin < endMin) {
      return 'occupied';
    }
  }
  return 'available';
}

int _parseTimeToMin(String hhmm) {
  final p = hhmm.split(':');
  if (p.length < 2) return 0;
  return (int.tryParse(p[0]) ?? 0) * 60 + (int.tryParse(p[1]) ?? 0);
}
