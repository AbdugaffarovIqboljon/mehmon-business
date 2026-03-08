import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/bookings/presentation/widgets/booking_date_formatters.dart';

class BookingMonthCalendar extends StatelessWidget {
  const BookingMonthCalendar({
    required this.focusedMonth,
    required this.selectedDate,
    required this.bookingCountsByDay,
    required this.onDateSelected,
    required this.onPreviousMonth,
    required this.onNextMonth,
    super.key,
  });

  final DateTime focusedMonth;
  final DateTime selectedDate;
  final Map<DateTime, int> bookingCountsByDay;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  @override
  Widget build(BuildContext context) {
    final monthDays = _buildMonthGridDays(focusedMonth);

    return LayoutBuilder(
      builder: (context, constraints) {
        const gridMainAxisSpacing = 4.0;
        const headerHeight = 52.0;
        const weekdaysHeight = 24.0;
        const verticalSpacing = 26.0;
        final gridHeight =
            constraints.maxHeight -
            headerHeight -
            weekdaysHeight -
            verticalSpacing;
        final clampedGridHeight = gridHeight.clamp(0.0, 330.0);
        var cellHeight = (clampedGridHeight - (gridMainAxisSpacing * 5)) / 6;
        if (cellHeight < 1) {
          cellHeight = 1;
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: headerHeight,
              child: Row(
                children: [
                  _MonthButton(
                    icon: Icons.chevron_left_rounded,
                    onTap: onPreviousMonth,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          bookingMonthLongLabel(context, focusedMonth),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: const Color(0xFF2C3552),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Text(
                          '${focusedMonth.year}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: const Color(0xFF98A3BC)),
                        ),
                      ],
                    ),
                  ),
                  _MonthButton(
                    icon: Icons.chevron_right_rounded,
                    onTap: onNextMonth,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: weekdaysHeight,
              child: Row(
                children: _weekdayLabels
                    .map(
                      (label) => Expanded(
                        child: Text(
                          label,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: const Color(0xFF8996B3),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            if (clampedGridHeight > 0)
              SizedBox(
                height: clampedGridHeight,
                child: RepaintBoundary(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: monthDays.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: DateTime.daysPerWeek,
                      mainAxisSpacing: gridMainAxisSpacing,
                      mainAxisExtent: cellHeight,
                    ),
                    itemBuilder: (context, index) {
                      final day = monthDays[index];
                      final isSelected = DateUtils.isSameDay(day, selectedDate);
                      final isInFocusedMonth =
                          day.month == focusedMonth.month &&
                          day.year == focusedMonth.year;
                      final dayLabelColor = isInFocusedMonth
                          ? const Color(0xFF27304A)
                          : const Color(0xFF9AA5BE);
                      final normalizedDay = DateUtils.dateOnly(day);
                      final indicatorCount =
                          bookingCountsByDay[normalizedDay] ?? 0;
                      var dayChipHeight = cellHeight - 6;
                      if (dayChipHeight > 42) {
                        dayChipHeight = 42;
                      }
                      if (dayChipHeight < 8) {
                        dayChipHeight = 8;
                      }
                      final hasIndicators = indicatorCount > 0;
                      final showIndicators = cellHeight >= 58 && hasIndicators;
                      final useCompactDayCell = cellHeight < 48;

                      return InkWell(
                        key: ValueKey<String>(
                          'booking-month-day-${normalizedDay.toIso8601String()}',
                        ),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusXl,
                        ),
                        onTap: () => onDateSelected(day),
                        child: useCompactDayCell
                            ? Stack(
                                fit: StackFit.expand,
                                children: [
                                  Center(
                                    child: Text(
                                      '${day.day}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: isSelected
                                                ? AppColors.primary
                                                : dayLabelColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  if (hasIndicators)
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 1,
                                        ),
                                        child: _IndicatorDots(
                                          count: indicatorCount,
                                          dotSize: 4,
                                          spacing: 2,
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.primary
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                        AppSpacing.radiusLg,
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 34,
                                      height: dayChipHeight,
                                      child: Center(
                                        child: Text(
                                          '${day.day}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: isSelected
                                                    ? Colors.white
                                                    : dayLabelColor,
                                                fontWeight: isSelected
                                                    ? FontWeight.w600
                                                    : FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (showIndicators)
                                    const SizedBox(height: AppSpacing.xs),
                                  if (showIndicators)
                                    _IndicatorDots(count: indicatorCount),
                                ],
                              ),
                      );
                    },
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _MonthButton extends StatelessWidget {
  const _MonthButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceVariant,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: SizedBox.square(
          dimension: 52,
          child: Icon(icon, color: const Color(0xFF2E3855), size: 32),
        ),
      ),
    );
  }
}

class _IndicatorDots extends StatelessWidget {
  const _IndicatorDots({
    required this.count,
    this.dotSize = 6,
    this.spacing = AppSpacing.xs,
  });

  final int count;
  final double dotSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) {
      return SizedBox(height: dotSize);
    }

    const indicatorColors = <Color>[
      Color(0xFF0DB07D),
      Color(0xFF6A56E4),
      Color(0xFF198EEA),
    ];
    final visibleCount = math.min(3, count);

    return SizedBox(
      height: dotSize,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          visibleCount,
          (index) => Container(
            width: dotSize,
            height: dotSize,
            margin: EdgeInsets.only(left: index == 0 ? 0 : spacing),
            decoration: BoxDecoration(
              color: indicatorColors[index % indicatorColors.length],
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
          ),
        ),
      ),
    );
  }
}

List<DateTime> _buildMonthGridDays(DateTime focusedMonth) {
  final firstDayOfMonth = DateTime(focusedMonth.year, focusedMonth.month);
  final leadingDays = firstDayOfMonth.weekday - DateTime.monday;
  final calendarStart = firstDayOfMonth.subtract(Duration(days: leadingDays));

  return List.generate(42, (index) => calendarStart.add(Duration(days: index)));
}

const _weekdayLabels = <String>[
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];
