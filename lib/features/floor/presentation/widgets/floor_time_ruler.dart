import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';

/// An interactive horizontal time ruler rendered with [CustomPainter].
///
/// The ruler is draggable. The [selectedMinute] is always visually centered.
/// Past tick marks are drawn faded; future ticks are solid black.
/// Between each pair of full-hour marks there are two evenly spaced short ticks
/// (at +20 min and +40 min), matching the Figma density.
///
/// While the user drags, the ruler also updates
/// [selectedTimelineProvider] so that downstream widgets (e.g. the floor
/// canvas) can render locally computed status for the scrubbed time. The
/// provider is reset to `null` (live mode) 5 seconds after the user releases.
class FloorTimeRuler extends ConsumerStatefulWidget {
  const FloorTimeRuler({
    required this.selectedMinute,
    required this.onTimeChanged,
    super.key,
  });

  /// Currently selected time expressed as minutes since midnight.
  final int selectedMinute;

  /// Called when the user drags the ruler to a new time.
  final ValueChanged<int> onTimeChanged;

  @override
  ConsumerState<FloorTimeRuler> createState() => _FloorTimeRulerState();
}

class _FloorTimeRulerState extends ConsumerState<FloorTimeRuler> {
  /// Accumulated horizontal drag offset in logical pixels.
  double _dragOffset = 0;

  /// Pending timer that flips the timeline back to live mode after a
  /// short idle period following the user's last drag.
  Timer? _resetTimer;

  // ── Layout constants ────────────────────────────────────────────────────
  /// Logical pixels per minute — controls overall ruler density.
  static const double _minuteWidth = 1.4;

  static const int _minMinute = 0;
  static const int _maxMinute = 24 * 60;

  static const Duration _liveResetDelay = Duration(seconds: 5);

  void _syncToProvider(int minute) {
    ref.read(selectedTimelineProvider.notifier).state =
        TimeOfDay(hour: minute ~/ 60, minute: minute % 60);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _dragOffset += details.delta.dx;

    final minuteDelta = (-_dragOffset / _minuteWidth).round();
    if (minuteDelta == 0) return;

    final newMinute = (widget.selectedMinute + minuteDelta).clamp(
      _minMinute,
      _maxMinute,
    );
    _dragOffset += minuteDelta * _minuteWidth;

    if (newMinute != widget.selectedMinute) {
      _resetTimer?.cancel();
      widget.onTimeChanged(newMinute);
      _syncToProvider(newMinute);
    }
  }

  void _onHorizontalDragEnd(DragEndDetails _) {
    _dragOffset = 0;
    _resetTimer?.cancel();
    _resetTimer = Timer(_liveResetDelay, () {
      if (!mounted) return;
      ref.read(selectedTimelineProvider.notifier).state = null;
    });
  }

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 52,
        child: CustomPaint(
          size: Size.infinite,
          painter: _TimeRulerPainter(
            selectedMinute: widget.selectedMinute,
            minuteWidth: _minuteWidth,
          ),
        ),
      ),
    );
  }
}

// ── Painter ──────────────────────────────────────────────────────────────────

class _TimeRulerPainter extends CustomPainter {
  _TimeRulerPainter({required this.selectedMinute, required this.minuteWidth});

  final int selectedMinute;
  final double minuteWidth;

  // ── Tick intervals ────────────────────────────────────────────────────
  /// How many minutes between sub-division ticks (2 sub-ticks per hour = 20 min).
  static const int _subTickInterval = 20;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.width / 2;

    final pastPaint = Paint()
      ..color = const Color(0xFFBDBDBD)
      ..strokeWidth = 1;
    final futurePaint = Paint()
      ..color = const Color(0xFF1A1A2E)
      ..strokeWidth = 1;
    final subTickPaint = Paint()..strokeWidth = 0.8;

    const pastLabel = TextStyle(
      fontSize: 10,
      color: Color(0xFFBDBDBD),
      fontWeight: FontWeight.w400,
    );
    const futureLabel = TextStyle(
      fontSize: 10,
      color: Color(0xFF1A1A2E),
      fontWeight: FontWeight.w500,
    );

    // ── Draw tick marks every 20 minutes, label every 60 minutes ─────────
    for (var minute = 0; minute <= 24 * 60; minute += _subTickInterval) {
      final dx = center + (minute - selectedMinute) * minuteWidth;

      // Cull ticks well outside the viewport.
      if (dx < -40 || dx > size.width + 40) continue;

      final isPast = minute < selectedMinute;
      final isFullHour = minute % 60 == 0;

      if (isFullHour) {
        // Tall full-hour tick.
        canvas.drawLine(
          Offset(dx, 4),
          Offset(dx, 22),
          isPast ? pastPaint : futurePaint,
        );

        // Hour label below tick.
        final hour = minute ~/ 60;
        final label = '${hour.toString().padLeft(2, '0')}:00';
        final tp = TextPainter(
          text: TextSpan(text: label, style: isPast ? pastLabel : futureLabel),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(canvas, Offset(dx - tp.width / 2, 26));
      } else {
        // Short sub-division tick.
        subTickPaint.color = isPast
            ? const Color(0xFFBDBDBD)
            : const Color(0xFF1A1A2E);
        canvas.drawLine(Offset(dx, 10), Offset(dx, 20), subTickPaint);
      }
    }

    // ── Center indicator ─────────────────────────────────────────────────
    final dotPaint = Paint()..color = const Color(0xFF1A1A2E);
    canvas
      ..drawCircle(Offset(center, 3), 3.5, dotPaint)
      ..drawLine(
        Offset(center, 3),
        Offset(center, 22),
        Paint()
          ..color = const Color(0xFF1A1A2E)
          ..strokeWidth = 1.5,
      );
  }

  @override
  bool shouldRepaint(covariant _TimeRulerPainter oldDelegate) =>
      oldDelegate.selectedMinute != selectedMinute;
}
