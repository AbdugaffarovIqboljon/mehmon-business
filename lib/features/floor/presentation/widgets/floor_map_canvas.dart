import 'dart:async';
import 'dart:math' show min, pi;

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
/// Tables with non-zero `x` or `y` render at their saved coordinates as-is
/// (negative values allowed — only NEW drags are clamped into the canvas
/// bounds). The rest fall into a 3-column auto-layout grid. Drag positions
/// live in per-table [ValueNotifier]s so only the dragged table rebuilds.
///
/// In live mode, drag end auto-persists 500ms after the last movement via
/// the floor controller. In edit mode, drag end buffers into
/// [pendingPositionsProvider] and is persisted on "Saqlash".
class FloorMapCanvas extends ConsumerStatefulWidget {
  const FloorMapCanvas({this.tables, super.key});

  final List<FloorEntity>? tables;

  @override
  ConsumerState<FloorMapCanvas> createState() => _FloorMapCanvasState();
}

class _FloorMapCanvasState extends ConsumerState<FloorMapCanvas> {
  static const double kCanvasWidth = 4000;
  static const double kCanvasHeight = 4000;
  static const double kTableSize = 100;
  static const double _kFitPadding = 60;

  static const int _gridColumns = 3;
  static const double _gridSpacing = 140;
  static const double _tableSmall = 100;
  static const double _tableLarge = 140;

  static const double _kLegacyOriginThreshold = 300;

  static const double _kDragThreshold = 12;

  late final ValueNotifier<String?> _selectedTableNotifier;
  late final TransformationController _transformController;
  final Map<String, ValueNotifier<Offset>> _positionNotifiers = {};
  final Map<String, Timer> _debounceTimers = {};
  final Map<String, Offset> _dragStartPositions = {};
  final Map<int, Offset> _dragStartByPointer = {};
  final Map<int, bool> _isDraggingByPointer = {};
  int? _activePanPointerId;
  bool _hasFit = false;
  final Set<String> _migratedTableIds = {};

  @override
  void initState() {
    super.initState();
    _selectedTableNotifier = ValueNotifier<String?>(null);
    _transformController = TransformationController();
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
    for (final t in _debounceTimers.values) {
      t.cancel();
    }
    _debounceTimers.clear();
    _dragStartPositions.clear();
    _dragStartByPointer.clear();
    _isDraggingByPointer.clear();
    _selectedTableNotifier.dispose();
    _transformController.dispose();
    for (final n in _positionNotifiers.values) {
      n.dispose();
    }
    _positionNotifiers.clear();
    super.dispose();
  }

  void _onTableTap(BuildContext context, FloorEntity entity) {
    _selectedTableNotifier.value = entity.id;

    // Edit mode: tap only selects (so rotation controls show). Detail
    // sheet stays off so the user can keep arranging.
    if (ref.read(floorEditModeProvider)) return;

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
      kCanvasWidth / 2 + (col - 1) * _gridSpacing,
      kCanvasHeight / 2 + (row - 1) * _gridSpacing,
    );
  }

  Offset _initialPositionFor(FloorEntity entity, int index, double tableW) {
    return _resolvedPositionFor(entity, index);
  }

  Offset _resolvedPositionFor(FloorEntity entity, int index) {
    final tableW = _tableWidthFor(entity);
    if (entity.x <= _kLegacyOriginThreshold ||
        entity.y <= _kLegacyOriginThreshold) {
      final resolved = _clampToCanvas(_autoLayoutPosition(index), tableW);
      if (!_migratedTableIds.contains(entity.id)) {
        _migratedTableIds.add(entity.id);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          unawaited(
            ref.read(floorControllerProvider.notifier).updateTablePosition(
              entity.id,
              resolved.dx,
              resolved.dy,
            ),
          );
        });
      }
      return resolved;
    }
    return _clampToCanvas(Offset(entity.x, entity.y), tableW);
  }

  Offset _clampToCanvas(Offset o, double tableW) {
    final maxX = (kCanvasWidth - tableW).clamp(0.0, kCanvasWidth);
    final maxY = (kCanvasHeight - kTableSize).clamp(0.0, kCanvasHeight);
    // Backend may legitimately store negative coords (e.g. table 5 at x: -16.6)
    // so the lower bound mirrors the table's own footprint, not 0.
    return Offset(
      o.dx.clamp(0.0, maxX),
      o.dy.clamp(0.0, maxY),
    );
  }

  void _fitToContent(BoxConstraints viewport) {
    final entities = widget.tables ?? const <FloorEntity>[];
    if (entities.isEmpty) return;

    var minX = double.infinity;
    var minY = double.infinity;
    var maxX = double.negativeInfinity;
    var maxY = double.negativeInfinity;
    for (var i = 0; i < entities.length; i++) {
      final p = _resolvedPositionFor(entities[i], i);
      if (p.dx < minX) minX = p.dx;
      if (p.dy < minY) minY = p.dy;
      final right = p.dx + kTableSize;
      final bottom = p.dy + kTableSize;
      if (right > maxX) maxX = right;
      if (bottom > maxY) maxY = bottom;
    }

    final paddedMinX = (minX - _kFitPadding).clamp(0.0, kCanvasWidth);
    final paddedMinY = (minY - _kFitPadding).clamp(0.0, kCanvasHeight);
    final contentW = (maxX - minX) + _kFitPadding * 2;
    final contentH = (maxY - minY) + _kFitPadding * 2;

    final scaleX = viewport.maxWidth / contentW;
    final scaleY = viewport.maxHeight / contentH;
    final scale = min(scaleX, scaleY).clamp(0.4, 1.2);

    final contentCenterX = paddedMinX + contentW / 2;
    final contentCenterY = paddedMinY + contentH / 2;
    final tx = viewport.maxWidth / 2 - contentCenterX * scale;
    final ty = viewport.maxHeight / 2 - contentCenterY * scale;

    final m = Matrix4.identity()
      ..translateByDouble(tx, ty, 0, 1)
      ..scaleByDouble(scale, scale, 1, 1);
    _transformController.value = _clampedMatrix(m, viewport);
  }

  Matrix4 _clampedMatrix(Matrix4 m, BoxConstraints viewport) {
    final scale = m.getMaxScaleOnAxis();
    final scaledW = kCanvasWidth * scale;
    final scaledH = kCanvasHeight * scale;
    // Any world point can be centered: canvas edge reaches screen midpoint
    final minTx = viewport.maxWidth  / 2 - scaledW;
    final maxTx = viewport.maxWidth  / 2;
    final minTy = viewport.maxHeight / 2 - scaledH;
    final maxTy = viewport.maxHeight / 2;
    final tx = m[12].clamp(minTx, maxTx);
    final ty = m[13].clamp(minTy, maxTy);
    return m..setTranslationRaw(tx, ty, 0);
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

  String? _labelFor(FloorEntity entity) => entity.effectiveLocation;

  // Gesture flow:
  // 1-finger on empty canvas → InteractiveViewer pan (smooth, inertia)
  // 1-finger on table       → table GestureDetector wins (opaque + deeper)
  //                           → tap or drag with threshold
  // 2-finger anywhere       → InteractiveViewer ScaleRecognizer wins
  //                           → focal-point pinch zoom (native feel)
  // After any interaction   → onInteractionEnd clamps matrix
  void _onPanStart(
    FloorEntity entity,
    ValueNotifier<Offset> notifier,
    DragStartDetails details,
  ) {
    _debounceTimers.remove(entity.id)?.cancel();
    _dragStartPositions[entity.id] = notifier.value;
    _activePanPointerId = details.sourceTimeStamp?.hashCode ?? 0;
    _dragStartByPointer[_activePanPointerId!] = details.localPosition;
    _isDraggingByPointer[_activePanPointerId!] = false;
  }

  void _onPanUpdate(
    ValueNotifier<Offset> notifier,
    double tableW,
    DragUpdateDetails details,
  ) {
    final key = _activePanPointerId ?? 0;
    if (!(_isDraggingByPointer[key] ?? false)) {
      final start = _dragStartByPointer[key];
      if (start == null) return;
      final distance = (details.localPosition - start).distance;
      if (distance < _kDragThreshold) return;
      _isDraggingByPointer[key] = true;
    }
    // Clamp NEW drags into canvas; existing negative positions are only
    // preserved on initial display.
    final scale = _transformController.value.getMaxScaleOnAxis();
    final worldDelta = details.delta / scale;
    notifier.value = _clampToCanvas(notifier.value + worldDelta, tableW);
  }

  void _onPanEnd(FloorEntity entity, ValueNotifier<Offset> notifier) {
    final key = _activePanPointerId ?? 0;
    final wasDragging = _isDraggingByPointer[key] ?? false;
    if (!wasDragging) {
      _dragStartByPointer.remove(key);
      _isDraggingByPointer.remove(key);
      _activePanPointerId = null;
      _onTableTap(context, entity);
      return;
    }

    final pos = notifier.value;
    _debounceTimers.remove(entity.id)?.cancel();

    final oldPosition = _dragStartPositions[entity.id] ?? pos;
    _dragStartByPointer.remove(key);
    _isDraggingByPointer.remove(key);
    _activePanPointerId = null;
    unawaited(_confirmAndSave(context, entity, oldPosition, pos, notifier));
  }

  Future<void> _confirmAndSave(
    BuildContext context,
    FloorEntity entity,
    Offset oldPosition,
    Offset newPosition,
    ValueNotifier<Offset> notifier,
  ) async {
    if (!mounted) return;
    final scheme = Theme.of(context).colorScheme;
    final result = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: scheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Stolni yangi joyga saqlaysizmi?',
                style: AppTextStyles.titleMedium.copyWith(
                  color: scheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: scheme.onSurface,
                        side: BorderSide(color: scheme.outline),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.pop(sheetCtx, false),
                      child: const Text('Bekor qilish'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: scheme.primary,
                        foregroundColor: scheme.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.pop(sheetCtx, true),
                      child: const Text('Saqlash'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (!mounted) return;
    if (result ?? false) {
      unawaited(
        ref.read(floorControllerProvider.notifier).updateTablePosition(
              entity.id,
              newPosition.dx,
              newPosition.dy,
            ),
      );
    } else {
      notifier.value = oldPosition;
    }
    _dragStartPositions.remove(entity.id);
  }

  void _rotateTable(FloorEntity table, double delta) {
    final pending = ref.read(pendingRotationsProvider);
    final current = pending[table.id] ?? table.rotation;
    // Normalize into [0, 360) so the displayed angle stays readable.
    final newRot = (current + delta) % 360;
    ref.read(pendingRotationsProvider.notifier).state = {
      ...pending,
      table.id: newRot < 0 ? newRot + 360 : newRot,
    };
  }

  void _resetNotifiersFromEntities() {
    final entities = widget.tables ?? const <FloorEntity>[];
    for (var i = 0; i < entities.length; i++) {
      final e = entities[i];
      final notifier = _positionNotifiers[e.id];
      if (notifier == null) continue;
      notifier.value = _initialPositionFor(e, i, _tableWidthFor(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    final entities = widget.tables ?? const <FloorEntity>[];

    // When edit mode exits (Saqlash or Bekor), drop drag-time visuals back
    // to whatever the entities now hold — for a Saqlash that means the
    // freshly-persisted x/y, for a Bekor that's the original server value.
    ref.listen<bool>(floorEditModeProvider, (prev, next) {
      if ((prev ?? false) && !next) {
        _selectedTableNotifier.value = null;
        _resetNotifiersFromEntities();
      }
    });

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
    final isEditing = ref.watch(floorEditModeProvider);
    final pendingRotations = ref.watch(pendingRotationsProvider);

    return ColoredBox(
      color: AppColors.floorCanvasBg,
      child: LayoutBuilder(
        builder: (context, constraints) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_hasFit && mounted) {
              _hasFit = true;
              _fitToContent(constraints);
            }
          });
          return ValueListenableBuilder<String?>(
            valueListenable: _selectedTableNotifier,
            builder: (_, selectedId, __) {
              final isTableActive = isEditing && selectedId != null;
              return InteractiveViewer(
                transformationController: _transformController,
                boundaryMargin: const EdgeInsets.all(double.infinity),
                minScale: 0.4,
                maxScale: 2,
                constrained: false,
                panEnabled: !isTableActive,
                onInteractionEnd: (_) {
                  final clamped = _clampedMatrix(
                    _transformController.value,
                    constraints,
                  );
                  if (clamped != _transformController.value) {
                    _transformController.value = clamped;
                  }
                },
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
                          isEditing: isEditing,
                          pendingRotation: pendingRotations[entities[i].id],
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTable(
    FloorEntity entity,
    int index,
    String? displayStatus, {
    required bool isEditing,
    required double? pendingRotation,
  }) {
    final tableW = _tableWidthFor(entity);
    final notifier = _notifierFor(entity, index, tableW);
    final config = FloorTableConfig.fromEntity(
      entity,
      index: index,
      useAutoLayout: false,
    );
    final label = _labelFor(entity);
    final rotationDeg = pendingRotation ?? entity.rotation;
    final rotationRad = rotationDeg * pi / 180;

    return ValueListenableBuilder<Offset>(
      key: ValueKey<String>(entity.id),
      valueListenable: notifier,
      builder: (_, pos, __) => ValueListenableBuilder<String?>(
        valueListenable: _selectedTableNotifier,
        builder: (_, selectedId, child) {
          final isDraggable = isEditing && selectedId == entity.id;
          return Positioned(
            left: pos.dx,
            top: pos.dy,
            width: tableW,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart:
                  isDraggable ? (d) => _onPanStart(entity, notifier, d) : null,
              onPanUpdate:
                  isDraggable ? (d) => _onPanUpdate(notifier, tableW, d) : null,
              onPanEnd:
                  isDraggable ? (_) => _onPanEnd(entity, notifier) : null,
              child: child!,
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(
              angle: rotationRad,
              child: FloorTableWidget(
                config: config,
                displayStatus: displayStatus,
                selectedNotifier: _selectedTableNotifier,
                onTap: () => _onTableTap(context, entity),
              ),
            ),
            if (label != null) ...[
              const SizedBox(height: 2),
              _ZoneBadge(label: label),
            ],
            if (isEditing)
              ValueListenableBuilder<String?>(
                valueListenable: _selectedTableNotifier,
                builder: (_, selectedId, __) {
                  if (selectedId != entity.id) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: _RotationControls(
                      rotationDeg: rotationDeg,
                      onRotateLeft: () => _rotateTable(entity, -45),
                      onRotateRight: () => _rotateTable(entity, 45),
                    ),
                  );
                },
              ),
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
    final t = selectedTime ?? TimeOfDay.fromDateTime(DateTime.now());
    return _computeStatusAtTime(
      tableId: entity.id,
      bookings: bookings,
      time: t,
    );
  }
}

class _RotationControls extends StatelessWidget {
  const _RotationControls({
    required this.rotationDeg,
    required this.onRotateLeft,
    required this.onRotateRight,
  });

  final double rotationDeg;
  final VoidCallback onRotateLeft;
  final VoidCallback onRotateRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _RotationButton(
          icon: Icons.rotate_left,
          onTap: onRotateLeft,
        ),
        const SizedBox(width: 6),
        Text(
          '${rotationDeg.toStringAsFixed(0)}°',
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 6),
        _RotationButton(
          icon: Icons.rotate_right,
          onTap: onRotateRight,
        ),
      ],
    );
  }
}

class _RotationButton extends StatelessWidget {
  const _RotationButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 14, color: Colors.white),
      ),
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
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  for (final b in bookings) {
    if (b.status == 'cancelled') continue;

    final bTableId = b.tableInfo?.id;
    if (bTableId != tableId) continue;

    final parsedDate = DateTime.tryParse(b.date)?.toLocal();
    if (parsedDate == null) continue;
    final bookingDay = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
    if (bookingDay != today) continue;

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

  // Pass 2 — no active booking; check if a future booking exists today.
  for (final b in bookings) {
    if (b.status == 'cancelled') continue;
    if (b.tableInfo?.id != tableId) continue;

    final parsedDate = DateTime.tryParse(b.date)?.toLocal();
    if (parsedDate == null) continue;
    final bookingDay =
        DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
    if (bookingDay != today) continue;

    final startParts = b.timeSlot.split(':');
    if (startParts.length < 2) continue;
    final startMin = (int.tryParse(startParts[0]) ?? 0) * 60 +
        (int.tryParse(startParts[1]) ?? 0);

    if (startMin > selectedMin) return 'booked';
  }

  return 'available';
}

int _parseTimeToMin(String hhmm) {
  final p = hhmm.split(':');
  if (p.length < 2) return 0;
  return (int.tryParse(p[0]) ?? 0) * 60 + (int.tryParse(p[1]) ?? 0);
}
