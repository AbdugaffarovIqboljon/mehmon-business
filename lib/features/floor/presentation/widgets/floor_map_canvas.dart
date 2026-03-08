import 'package:flutter/material.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/models/floor_table_config.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_table_widget.dart';

/// The floor map area that positions table widgets using [Stack] + [Positioned].
///
/// Uses [LayoutBuilder] to convert fractional coordinates from
/// [FloorTableConfig] into actual pixel offsets.
class FloorMapCanvas extends StatefulWidget {
  const FloorMapCanvas({super.key});

  @override
  State<FloorMapCanvas> createState() => _FloorMapCanvasState();
}

class _FloorMapCanvasState extends State<FloorMapCanvas> {
  /// Holds the ID of the currently selected table. Null if no table is selected.
  late final ValueNotifier<String?> _selectedTableNotifier;

  @override
  void initState() {
    super.initState();
    _selectedTableNotifier = ValueNotifier<String?>(null);
  }

  @override
  void dispose() {
    _selectedTableNotifier.dispose();
    super.dispose();
  }

  void _onTableTap(String tableId) {
    if (_selectedTableNotifier.value == tableId) {
      // Optional: uncomment the next line if tapping an already selected table should deselect it.
      // _selectedTableNotifier.value = null;
      return;
    }
    _selectedTableNotifier.value = tableId;
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.floorCanvasBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xxl,
          vertical: AppSpacing.xl,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final canvasW = constraints.maxWidth;
            final canvasH = constraints.maxHeight;

            return Stack(
              children: [
                for (final table in kFloorTables)
                  Positioned(
                    left: table.left * canvasW,
                    top: table.top * canvasH,
                    width: table.width * canvasW,
                    child: FloorTableWidget(
                      config: table,
                      selectedNotifier: _selectedTableNotifier,
                      onTap: () => _onTableTap(table.id),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
