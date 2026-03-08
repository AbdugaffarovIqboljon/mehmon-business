import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class BookingMonthDropdown extends StatelessWidget {
  const BookingMonthDropdown({
    required this.selectedMonth,
    required this.onMonthSelected,
    super.key,
  });

  final DateTime selectedMonth;
  final ValueChanged<DateTime> onMonthSelected;

  static const List<String> _monthLabels = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final currentMonth = DateTime(selectedMonth.year, selectedMonth.month);

    return PopupMenuButton<DateTime>(
      onSelected: onMonthSelected,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      itemBuilder: (context) {
        return List<PopupMenuEntry<DateTime>>.generate(12, (index) {
          final month = DateTime(currentMonth.year, index + 1);
          return PopupMenuItem<DateTime>(
            value: month,
            child: Text(
              _monthLabels[index],
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.6)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _monthLabels[currentMonth.month - 1],
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Icon(Icons.keyboard_arrow_down_rounded, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}
