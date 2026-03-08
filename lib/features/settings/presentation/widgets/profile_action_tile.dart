import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class ProfileActionTile extends StatelessWidget {
  const ProfileActionTile({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
    this.trailingText,
    this.showChevron = true,
    this.isDestructive = false,
    this.isLoading = false,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final String? trailingText;
  final bool showChevron;
  final bool isDestructive;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final primaryColor = isDestructive ? AppColors.error : AppColors.textPrimary;
    final secondaryColor = isDestructive
        ? AppColors.error.withValues(alpha: 0.12)
        : AppColors.surfaceVariant;

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        onTap: isLoading ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                ),
                child: Icon(icon, color: primaryColor, size: 22),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (trailingText != null) ...[
                Text(
                  trailingText!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
              if (isLoading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              else if (showChevron)
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: AppColors.textHint,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
