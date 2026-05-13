import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/guests/domain/entities/guest_entity.dart';

class GuestVisitHistoryCard extends StatelessWidget {
  const GuestVisitHistoryCard({required this.visits, super.key});

  final List<VisitEntity> visits;

  @override
  Widget build(BuildContext context) {
    if (visits.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          "Tashriflar yo'q",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.35,
              ),
        ),
      );
    }

    return Column(
      spacing: AppSpacing.md,
      children: visits.map((visit) => _VisitRow(visit: visit)).toList(),
    );
  }
}

class _VisitRow extends StatelessWidget {
  const _VisitRow({required this.visit});

  final VisitEntity visit;

  String _formatDate(String isoDate) {
    if (isoDate.trim().isEmpty) return '-';
    try {
      return DateFormat('dd.MM.yy').format(DateTime.parse(isoDate));
    } on FormatException {
      return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ValueColumn(title: 'Sana', value: _formatDate(visit.date)),
          ),
          Expanded(
            child: _ValueColumn(title: 'Stol', value: visit.tableNumber),
          ),
          Expanded(
            child: _ValueColumn(
              title: 'Mehmonlar',
              value: '${visit.numberOfGuests}',
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueColumn extends StatelessWidget {
  const _ValueColumn({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.5,
                  letterSpacing: 0.1,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  height: 1.3,
                ),
          ),
        ],
      ),
    );
  }
}
