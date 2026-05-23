import 'package:flutter/material.dart';
import 'package:mehmon/core/errors/failure.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/primary_button.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({
    required this.error,
    super.key,
    this.onRetry,
    this.compact = false,
  });

  /// The error object from AsyncValue.when(error: (e, _) => e).
  /// Can be a Failure subtype or any Object.
  final Object error;

  /// If provided, shows a retry button calling this.
  final VoidCallback? onRetry;

  /// If true, renders a smaller inline version (for stats summary etc.)
  final bool compact;

  String _resolveMessage() {
    if (error is Failure) return (error as Failure).userMessage;
    return 'Kutilmagan xatolik';
  }

  IconData _resolveIcon() {
    if (error is NetworkFailure) return Icons.wifi_off_rounded;
    if (error is ServerFailure) {
      final f = error as ServerFailure;
      if (f.statusCode == 404) return Icons.search_off_rounded;
      if (f.statusCode != null && f.statusCode! >= 500) {
        return Icons.cloud_off_rounded;
      }
      if (f.message.startsWith('timeout')) return Icons.cloud_off_rounded;
    }
    return Icons.error_outline_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final message = _resolveMessage();
    final icon = _resolveIcon();

    if (compact) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: AppColors.error),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              message,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
            ),
          ),
        ],
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: AppColors.textSecondary),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 20),
              PrimaryButton(
                label: 'Qayta urinish',
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
