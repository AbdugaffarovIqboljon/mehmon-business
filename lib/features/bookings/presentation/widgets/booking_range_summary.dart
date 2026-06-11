import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/bookings/domain/services/booking_conflict_resolver.dart';

/// Live summary of the selected booking window, e.g. "12:00 → 14:00 · 2 soat".
/// Pure presentation: fed the current start/end strings by the parent's
/// ValueListenableBuilder, it derives and formats the duration in Uzbek.
class BookingRangeSummary extends StatelessWidget {
  const BookingRangeSummary({
    required this.startTime,
    required this.endTime,
    super.key,
  });

  final String startTime;
  final String? endTime;

  /// 30 → "30 daqiqa", 90 → "1 soat 30 daqiqa", 120 → "2 soat".
  static String formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours == 0) return '$mins daqiqa';
    if (mins == 0) return '$hours soat';
    return '$hours soat $mins daqiqa';
  }

  @override
  Widget build(BuildContext context) {
    final end = endTime;
    final startMin = hhmmToMin(startTime);
    final endMin = end != null ? hhmmToMin(end) : null;
    final hasRange =
        end != null && startMin != null && endMin != null && endMin > startMin;

    final summary = hasRange
        ? '$startTime → $end · ${formatDuration(endMin - startMin)}'
        : startTime;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.schedule_rounded,
            size: 18,
            color: AppColors.primaryDark,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              summary,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
