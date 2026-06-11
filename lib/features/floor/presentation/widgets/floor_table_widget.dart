import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/models/floor_table_config.dart';

/// Single source of truth mapping a resolved table status to its colour.
///
/// Shared by the floor canvas ([FloorTableWidget]) and the table detail sheet
/// so the map dot, the sheet dot, and the status banner all paint the same hue
/// per status — `occupied` is the canvas red (0xFFDC2626) everywhere.
Color tableStatusColor(String status) => switch (status) {
      'free' => AppColors.success,
      'reserved' => AppColors.warning,
      'waiting' => const Color(0xFF7C3AED),
      'guest_arrived' => AppColors.info,
      'occupied' => const Color(0xFFDC2626),
      _ => AppColors.disabled,
    };

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

  /// Optional status string ("available" | "booked" | "occupied") that
  /// overrides [FloorTableConfig.statusColor]. When non-null, the dot color
  /// is resolved from [AppColors] instead of the config.
  final String? displayStatus;

  final ValueListenable<String?>? selectedNotifier;
  final VoidCallback? onTap;

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
        ? tableStatusColor(displayStatus!)
        : config.statusColor;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          config.assetPath,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.low,
          color: dotColor?.withValues(alpha: 0.65),
          colorBlendMode: BlendMode.srcATop,
        ),
        if (config.label != null)
          Positioned(
            left: 4,
            right: 4,
            child: Center(
              child: Text(
                config.label!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black87,
                      offset: Offset(0, 1),
                    ),
                    Shadow(blurRadius: 3, color: Colors.black54),
                  ],
                ),
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
