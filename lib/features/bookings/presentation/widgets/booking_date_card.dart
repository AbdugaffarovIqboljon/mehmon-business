import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_formatters.dart';

class BookingDateCard extends StatelessWidget {
  const BookingDateCard({
    required this.date,
    required this.isSelected,
    required this.onTap,
    this.onLongPress,
    super.key,
  });

  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final normalizedDate = DateUtils.dateOnly(date);
    final textColor = isSelected ? Colors.white : AppColors.textPrimary;
    final cardColor = isSelected ? AppColors.primary : AppColors.card;
    final secondaryTextColor = isSelected
        ? Colors.white.withValues(alpha: 0.92)
        : AppColors.textSecondary;
    final cardKey = isSelected
        ? const ValueKey('booking-date-card-selected')
        : ValueKey<String>(
            'booking-date-card-${normalizedDate.toIso8601String()}');

    return Material(
      key: cardKey,
      color: cardColor,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        onLongPress: onLongPress,
        child: SizedBox(
          width: 102,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.lg,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bookingMonthShortLabel(date),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '${date.day}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  bookingWeekdayLabel(date),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
