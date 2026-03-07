import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';

class AuthSelectionField extends StatelessWidget {
  const AuthSelectionField({
    required this.text,
    required this.onTap,
    super.key,
    this.isPlaceholder = false,
    this.trailingIcon = Icons.keyboard_arrow_down_rounded,
    this.enabled = true,
  });

  final String text;
  final VoidCallback onTap;
  final bool isPlaceholder;
  final IconData trailingIcon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppSpacing.radiusLg);
    final textStyle = isPlaceholder
        ? AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint)
        : AppTextStyles.bodyLarge;

    return Material(
      color: enabled ? AppColors.surface : AppColors.surfaceVariant,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: const BorderSide(color: AppColors.divider),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Icon(
                  trailingIcon,
                  size: 20,
                  color: enabled ? AppColors.textSecondary : AppColors.disabled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
