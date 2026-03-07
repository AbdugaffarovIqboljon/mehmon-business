import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class GuestInfoStatRow extends StatelessWidget {
  const GuestInfoStatRow({
    required this.tableLabel,
    required this.visitDate,
    required this.guestCount,
    super.key,
  });

  final String tableLabel;
  final String visitDate;
  final int guestCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatColumn(
            label: 'Стол',
            value: tableLabel,
          ),
        ),
        Expanded(
          child: _StatColumn(
            label: 'Date',
            value: visitDate,
          ),
        ),
        Expanded(
          child: _StatColumn(
            label: 'Кол.во гостей',
            value: '$guestCount',
          ),
        ),
      ],
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.textHint,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
