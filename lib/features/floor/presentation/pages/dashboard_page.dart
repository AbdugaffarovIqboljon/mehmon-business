import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/floor/presentation/widgets/dashboard_double_stat_card.dart';
import 'package:mehmon/features/floor/presentation/widgets/dashboard_metric_card.dart';
import 'package:mehmon/features/floor/presentation/widgets/guest_traffic_chart.dart';
import 'package:mehmon/features/floor/presentation/widgets/hall_occupancy_chart.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const _sectionSpacing = SizedBox(height: AppSpacing.lg);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateText = _formatDate(DateTime.now());

    return AppScaffold(
      title: AppLocalizations.of(context)!.drawerDashboard,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpacing.xs),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppLocalizations.of(context)!.todayDate(dateText),
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            _sectionSpacing,
            DashboardMetricCard(
              title: AppLocalizations.of(context)!.expectedGuests,
              value: '200',
            ),
            _sectionSpacing,
            Row(
              children: [
                Expanded(
                  child: DashboardDoubleStatCard(
                    title: AppLocalizations.of(context)!.guestsInHall,
                    value: '50',
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: DashboardDoubleStatCard(
                    title: AppLocalizations.of(context)!.bookingsLabel,
                    value: '85',
                  ),
                ),
              ],
            ),
            _sectionSpacing,
            const GuestTrafficChart(),
            _sectionSpacing,
            const HallOccupancyChart(occupancy: 0.74),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day.$month.$year';
  }
}
