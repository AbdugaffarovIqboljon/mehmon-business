import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class FloorDrawerItem extends StatelessWidget {
  const FloorDrawerItem({
    required this.label,
    required this.onTap,
    super.key,
    this.iconAsset,
  });

  final String label;
  final String? iconAsset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const textColor = AppColors.textSecondary;
    const iconColor = Color(0xFF8891A1);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return const Color(0x1AF49B33);
          }
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return const Color(0x0FF49B33);
          }
          return null;
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 28,
                child: iconAsset != null
                    ? Image.asset(
                        iconAsset!,
                        width: 24,
                        height: 24,
                        color: iconColor,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.low,
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 42 / 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
