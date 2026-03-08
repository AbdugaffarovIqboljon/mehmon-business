import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/models/floor_table_config.dart';

/// Renders a single table on the floor map using its PNG asset.
///
/// Optionally overlays a label and provides an [onTap] callback
/// for future tap interaction. Subscribes to [selectedNotifier] to
/// show a premium highlight when selected.
class FloorTableWidget extends StatelessWidget {
  const FloorTableWidget({
    required this.config,
    this.selectedNotifier,
    this.onTap,
    super.key,
  });

  /// Configuration for this table (asset, label, etc.).
  final FloorTableConfig config;

  /// Notifier containing the ID of the currently selected table.
  final ValueListenable<String?>? selectedNotifier;

  /// Called when the user taps the table.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // If no notifier is provided, just render statically (for safety)
    if (selectedNotifier == null) {
      return _buildStatic();
    }

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
            // Premium highlight: subtle scale and soft shadow accent.
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
      child: Stack(
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
        ],
      ),
    );
  }

  Widget _buildStatic() {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
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
        ],
      ),
    );
  }
}
