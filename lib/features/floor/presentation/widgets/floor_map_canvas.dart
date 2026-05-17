import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/bookings/domain/entities/booking_entity.dart';
import 'package:mehmon/features/bookings/presentation/controllers/booking_controller.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/models/floor_table_config.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_table_widget.dart';
import 'package:mehmon/features/floor/presentation/widgets/table_detail_sheet.dart';

/// Floor map canvas: absolute pixel-positioned tables on a [Stack].
///
/// Tables with non-zero `x` or `y` render at their saved coordinates; the
/// rest fall into a 3-column auto-layout grid so freshly created tables
/// don't pile up at the origin. Manager-driven drag updates are debounced
/// 500ms after the last movement and persisted via the floor controller.
class FloorMapCanvas extends ConsumerStatefulWidget {
  const FloorMapCanvas({this.tables, super.key});

  final List<FloorEntity>? tables;

  @override
  ConsumerState<FloorMapCanvas> createState() => _FloorMapCanvasState();
}

class _FloorMapCanvasState extends ConsumerState<FloorMapCanvas> {
  late final ValueNotifier<String?> _selectedTableNotifier;
  final Map<String, Offset> _dragOffsets = {};
  Timer? _debounceTimer;

  static const int _gridColumns = 3;
  static const double _gridSpacing = 140;
  static const double _gridMargin = 20;
  static const double _tableSmall = 100;
  static const double _tableLarge = 140;

  @override
  void initState() {
    super.initState();
    _selectedTableNotifier = ValueNotifier<String?>(null);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _selectedTableNotifier.dispose();
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

  Offset _positionFor(FloorEntity entity, int index) {
    final dragged = _dragOffsets[entity.id];
    if (dragged != null) return dragged;
    final hasPosition = entity.x != 0 || entity.y != 0;
    if (hasPosition) return Offset(entity.x, entity.y);
    return _autoLayoutPosition(index);
  }

  double _tableWidthFor(FloorEntity entity) =>
      entity.capacity >= 5 ? _tableLarge : _tableSmall;

  void _onPanStart(DragStartDetails _) {
    _debounceTimer?.cancel();
  }

  void _onPanUpdate(FloorEntity entity, int index, DragUpdateDetails details) {
    final current = _dragOffsets[entity.id] ?? _positionFor(entity, index);
    setState(() {
      _dragOffsets[entity.id] = current + details.delta;
    });
  }

  void _onPanEnd(FloorEntity entity, DragEndDetails _) {
    final pos = _dragOffsets[entity.id];
    if (pos == null) return;
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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xxl,
          vertical: AppSpacing.xl,
        ),
        child: Stack(
          clipBehavior: Clip.none,
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
    );
  }

  Widget _buildTable(FloorEntity entity, int index, String? displayStatus) {
    final pos = _positionFor(entity, index);
    final config = FloorTableConfig.fromEntity(
      entity,
      index: index,
      useAutoLayout: false,
    );

    return Positioned(
      key: ValueKey<String>(entity.id),
      left: pos.dx,
      top: pos.dy,
      width: _tableWidthFor(entity),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: _onPanStart,
        onPanUpdate: (d) => _onPanUpdate(entity, index, d),
        onPanEnd: (d) => _onPanEnd(entity, d),
        child: FloorTableWidget(
          config: config,
          displayStatus: displayStatus,
          selectedNotifier: _selectedTableNotifier,
          onTap: () => _onTableTap(context, entity),
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

// ── Pure helpers (top-level, no closures) ───────────────────────────────────

String _computeStatusAtTime({
  required String tableId,
  required List<BookingEntity> bookings,
  required TimeOfDay time,
}) {
  final selectedMin = time.hour * 60 + time.minute;

  for (final b in bookings) {
    if (b.status != 'confirmed') continue;

    final bTableId = b.tableInfo?.id;
    if (bTableId != tableId) continue;

    final startParts = b.timeSlot.split(':');
    if (startParts.length < 2) continue;
    final startMin = (int.tryParse(startParts[0]) ?? 0) * 60 +
        (int.tryParse(startParts[1]) ?? 0);

    final endMin = b.endTime != null
        ? _parseTimeToMin(b.endTime!)
        : startMin + 120;

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
