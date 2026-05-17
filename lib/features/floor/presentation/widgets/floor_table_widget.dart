import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/models/floor_table_config.dart';

/// Renders a single table on the floor map using its PNG asset.
///
/// Shows a small status dot in the top-right corner when
/// [FloorTableConfig.statusColor] is provided.
class FloorTableWidget extends StatelessWidget {
  const FloorTableWidget({
    required this.config,
    this.displayStatus,
    this.selectedNotifier,
    this.onTap,
    super.key,
  });

  final FloorTableConfig config;

  /// Optional status string ("available" | "occupied" | ...) that overrides
  /// [FloorTableConfig.statusColor]. When non-null, the dot color is
  /// resolved from [AppColors] instead of the config.
  final String? displayStatus;

  final ValueListenable<String?>? selectedNotifier;
  final VoidCallback? onTap;

  static Color? _colorForStatus(String status) => switch (status) {
        'available' => AppColors.success,
        'occupied' => AppColors.error,
        _ => AppColors.disabled,
      };

  @override
  Widget build(BuildContext context) {
    if (selectedNotifier == null) return _buildStatic();

    return ValueListenableBuilder<String?>(
      valueListenable: selectedNotifier!,
      builder: (context, selectedId, child) {
        final isSelected = selectedId == config.id;

        return GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            transform: Matrix4.diagonal3Values(
              isSelected ? 1.05 : 1,
              isSelected ? 1.05 : 1,
              1,
            ),
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.25),
                        blurRadius: 16,
                        spreadRadius: 4,
                      ),
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: child,
          ),
        );
      },
      child: _tableContent(),
    );
  }

  Widget _buildStatic() {
    return GestureDetector(
      onTap: onTap,
      child: _tableContent(),
    );
  }

  Widget _tableContent() {
    final dotColor = displayStatus != null
        ? _colorForStatus(displayStatus!)
        : config.statusColor;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          config.assetPath,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.low,
        ),
        if (config.label != null)
          Positioned(
            child: Text(
              config.label!,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: [Shadow(blurRadius: 4, color: Colors.black54)],
              ),
            ),
          ),
        if (dotColor != null)
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}
