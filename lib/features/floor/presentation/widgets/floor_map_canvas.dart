import 'package:flutter/material.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/models/floor_table_config.dart';
import 'package:mehmon/features/floor/presentation/widgets/floor_table_widget.dart';
import 'package:mehmon/features/floor/presentation/widgets/table_options_sheet.dart';

/// The floor map area that positions table widgets using [Stack] + [Positioned].
///
/// Accepts a [tables] list from the controller; falls back to the static
/// [kFloorTables] fixture when no data is provided.
///
/// Uses [LayoutBuilder] to convert fractional coordinates from
/// [FloorTableConfig] into actual pixel offsets.
class FloorMapCanvas extends StatefulWidget {
  const FloorMapCanvas({this.tables, super.key});

  /// Real table data from the backend. When null or empty, the static
  /// fixture layout is shown instead.
  final List<FloorEntity>? tables;

  @override
  State<FloorMapCanvas> createState() => _FloorMapCanvasState();
}

class _FloorMapCanvasState extends State<FloorMapCanvas> {
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

  void _onTableTap(BuildContext context, String tableId) {
    _selectedTableNotifier.value = tableId;

    FloorEntity? entity;
    for (final e in widget.tables ?? const <FloorEntity>[]) {
      if (e.id == tableId) {
        entity = e;
        break;
      }
    }
    if (entity == null) return;

    showModalBottomSheet<void>(
      context: context,
      builder: (_) => TableOptionsSheet(table: entity!),
    );
  }

  List<FloorTableConfig> get _configs {
    final entities = widget.tables;
    if (entities == null || entities.isEmpty) return const [];

    final useAutoLayout = entities.every((e) => e.x == 0.0 && e.y == 0.0);
    return [
      for (var i = 0; i < entities.length; i++)
        FloorTableConfig.fromEntity(
          entities[i],
          index: i,
          useAutoLayout: useAutoLayout,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final configs = _configs;

    if (configs.isEmpty) {
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
                for (final table in configs)
                  Positioned(
                    left: table.left * canvasW,
                    top: table.top * canvasH,
                    width: table.width * canvasW,
                    child: FloorTableWidget(
                      config: table,
                      selectedNotifier: _selectedTableNotifier,
                      onTap: () => _onTableTap(context, table.id),
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
