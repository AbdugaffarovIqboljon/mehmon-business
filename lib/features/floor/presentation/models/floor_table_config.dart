import 'package:flutter/material.dart';

import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';

/// Lightweight configuration for a single table on the floor map.
///
/// Positions use **fractional coordinates** (0 – 1) so the layout scales
/// proportionally across different screen sizes.
class FloorTableConfig {
  const FloorTableConfig({
    required this.id,
    required this.assetPath,
    required this.left,
    required this.top,
    this.label,
    this.width = 0.18,
    this.statusColor,
  });

  factory FloorTableConfig.fromEntity(
    FloorEntity entity, {
    required int index,
    required bool useAutoLayout,
  }) {
    final (left, top, width) = useAutoLayout
        ? _autoLayoutFor(index, entity.capacity)
        : (entity.x, entity.y, _widthForCapacity(entity.capacity));

    return FloorTableConfig(
      id: entity.id,
      label: entity.displayNumber,
      assetPath: _assetFor(entity),
      left: left,
      top: top,
      width: width,
      statusColor: _statusColorFor(entity.status),
    );
  }

  /// Unique table identifier.
  final String id;

  /// Optional visible label, e.g. "T-01".
  final String? label;

  /// Path to the PNG asset used for this table.
  final String assetPath;

  /// Fractional horizontal position (0 = left edge, 1 = right edge).
  final double left;

  /// Fractional vertical position (0 = top edge, 1 = bottom edge).
  final double top;

  /// Fractional width of the table relative to canvas width.
  final double width;

  /// Optional status indicator color: green=available, orange=booked,
  /// blue=occupied, grey=other.
  final Color? statusColor;

  // ── Helpers ───────────────────────────────────────────────────────────────

  static (double left, double top, double width) _autoLayoutFor(
    int index,
    int capacity,
  ) {
    if (index < kFloorTables.length) {
      final t = kFloorTables[index];
      return (t.left, t.top, t.width);
    }
    // Simple 3-column grid for tables beyond the fixed layout.
    const colPositions = [0.06, 0.41, 0.76];
    final col = index % 3;
    final row = index ~/ 3;
    return (colPositions[col], (row * 0.21).clamp(0.0, 0.84), 0.18);
  }

  static double _widthForCapacity(int capacity) =>
      capacity >= 5 ? 0.32 : 0.18;

  static Color _statusColorFor(String status) => switch (status) {
        'free' => AppColors.success,
        'reserved' => AppColors.warning,
        'waiting' => const Color(0xFF7C3AED),
        'guest_arrived' => AppColors.info,
        'occupied' => const Color(0xFFDC2626),
        _ => AppColors.disabled,
      };

  static String _assetFor(FloorEntity entity) {
    final type = entity.tableType?.toLowerCase();
    if (type == 'rectangle') return _seats6;
    if (type == 'square') return _seats4;
    if (type == 'circle') return _seats3;
    if (entity.capacity >= 5) return _seats6;
    if (entity.capacity >= 4) return _seats4;
    return _seats3;
  }
}

// ── Asset paths ───────────────────────────────────────────────────────────

const _seats3 = 'assets/icons/ic_table_seats_3.png';
const _seats4 = 'assets/icons/ic_table_seats_4.png';
const _seats6 = 'assets/icons/ic_table_seats_6.png';

// ── Floor layout matching the Figma design ────────────────────────────────
//
// 5 rows evenly spread vertically (top: 0.00, 0.21, 0.42, 0.63, 0.84).
// Horizontal alignment centered:
// - 3 small tables: left edge 0.06, center 0.41, right 0.76 (width 0.18)
// - 2 wide tables: left 0.10, right 0.58 (width 0.32)

const List<FloorTableConfig> kFloorTables = [
  // ── Row 1: small tables ───────────────────────────────────────────────
  FloorTableConfig(
    id: '1',
    label: 'No.1',
    assetPath: _seats3,
    left: 0.06,
    top: 0,
  ),
  FloorTableConfig(
    id: '2',
    label: 'No.2',
    assetPath: _seats4,
    left: 0.41,
    top: 0,
  ),
  FloorTableConfig(id: '3', assetPath: _seats3, left: 0.76, top: 0),

  // ── Row 2: wide 6-seat tables ─────────────────────────────────────────
  FloorTableConfig(
    id: '4',
    label: 'No.3',
    assetPath: _seats6,
    left: 0.10,
    top: 0.21,
    width: 0.32,
  ),
  FloorTableConfig(
    id: '5',
    assetPath: _seats6,
    left: 0.58,
    top: 0.21,
    width: 0.32,
  ),

  // ── Row 3: center row ─────────────────────────────────────────────────
  FloorTableConfig(id: '6', assetPath: _seats4, left: 0.06, top: 0.42),
  FloorTableConfig(id: '7', assetPath: _seats4, left: 0.41, top: 0.42),
  FloorTableConfig(id: '8', assetPath: _seats4, left: 0.76, top: 0.42),

  // ── Row 4: wide 6-seat tables ─────────────────────────────────────────
  FloorTableConfig(
    id: '9',
    assetPath: _seats6,
    left: 0.10,
    top: 0.63,
    width: 0.32,
  ),
  FloorTableConfig(
    id: '10',
    assetPath: _seats6,
    left: 0.58,
    top: 0.63,
    width: 0.32,
  ),

  // ── Row 5: bottom row ─────────────────────────────────────────────────
  FloorTableConfig(id: '11', assetPath: _seats4, left: 0.06, top: 0.84),
  FloorTableConfig(id: '12', assetPath: _seats4, left: 0.41, top: 0.84),
  FloorTableConfig(id: '13', assetPath: _seats4, left: 0.76, top: 0.84),
];
