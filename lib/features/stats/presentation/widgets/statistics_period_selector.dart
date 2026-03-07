import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

enum StatisticsPeriod {
  daily('Daily'),
  weekly('Weekly'),
  monthly('Monthly');

  const StatisticsPeriod(this.label);
  final String label;
}

class StatisticsPeriodSelector extends StatelessWidget {
  const StatisticsPeriodSelector({
    required this.selectedPeriod,
    required this.onChanged,
    super.key,
  });

  final StatisticsPeriod selectedPeriod;
  final ValueChanged<StatisticsPeriod> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: StatisticsPeriod.values.map((period) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: period == StatisticsPeriod.values.last ? 0 : AppSpacing.sm,
            ),
            child: _StatisticsPeriodButton(
              label: period.label,
              isSelected: selectedPeriod == period,
              onTap: () => onChanged(period),
            ),
          ),
        );
      }).toList(growable: false),
    );
  }
}

class _StatisticsPeriodButton extends StatelessWidget {
  const _StatisticsPeriodButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          height: 46,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.divider,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF465CC7).withValues(alpha: 0.12),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : const [],
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : AppColors.textSecondary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
