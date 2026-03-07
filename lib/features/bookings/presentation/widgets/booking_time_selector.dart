import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class BookingTimeSelector extends StatelessWidget {
  const BookingTimeSelector({
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
    super.key,
  });

  final List<String> times;
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = AppSpacing.md;
        final itemWidth =
            ((constraints.maxWidth - (spacing * 3)) / 4).clamp(72.0, 120.0);

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: times.map((time) {
            final isSelected = time == selectedTime;
            return SizedBox(
              width: itemWidth,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  onTap: () => onTimeSelected(time),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.surface,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.md,
                      ),
                      child: Text(
                        time,
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge?.copyWith(
                          color:
                              isSelected ? Colors.white : AppColors.primaryDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
