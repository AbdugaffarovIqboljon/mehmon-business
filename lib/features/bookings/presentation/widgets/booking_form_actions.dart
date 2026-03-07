import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';

class BookingFormActions extends StatelessWidget {
  const BookingFormActions({
    required this.onCancel,
    required this.onConfirm,
    super.key,
    this.isConfirmEnabled = true,
  });

  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final bool isConfirmEnabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 56,
          child: TextButton(
            onPressed: onCancel,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.surfaceVariant,
              foregroundColor: AppColors.textPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              textStyle: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            child: const Row(
              children: [
                Text('Cancel'),
                SizedBox(width: AppSpacing.xl),
                Icon(Icons.close_rounded),
              ],
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 56,
          child: ElevatedButton(
            onPressed: isConfirmEnabled ? onConfirm : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              disabledBackgroundColor: AppColors.disabled,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              elevation: 0,
              textStyle: AppTextStyles.titleLarge.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: const Text('Confirm'),
          ),
        ),
      ],
    );
  }
}
