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
  });

  /// Unique table identifier.
  final String id;

  /// Optional visible label, e.g. "No.1".
  final String? label;

  /// Path to the PNG asset used for this table.
  final String assetPath;

  /// Fractional horizontal position (0 = left edge, 1 = right edge).
  final double left;

  /// Fractional vertical position (0 = top edge, 1 = bottom edge).
  final double top;

  /// Fractional width of the table relative to canvas width.
  final double width;
}

// ── Asset paths ───────────────────────────────────────────────────────────

const _seats3 = 'assets/icons/ic_table_seats_3.png';
const _seats4 = 'assets/icons/ic_table_seats_4.png';
const _seats4r = 'assets/icons/ic_table_seats_4_rotated.png';
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
    assetPath: _seats4r,
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
  FloorTableConfig(id: '7', assetPath: _seats4r, left: 0.41, top: 0.42),
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
  FloorTableConfig(id: '12', assetPath: _seats4r, left: 0.41, top: 0.84),
  FloorTableConfig(id: '13', assetPath: _seats4, left: 0.76, top: 0.84),
];
