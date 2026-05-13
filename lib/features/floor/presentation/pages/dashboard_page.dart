import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/floor/presentation/widgets/dashboard_double_stat_card.dart';
import 'package:mehmon/features/floor/presentation/widgets/dashboard_metric_card.dart';
import 'package:mehmon/features/floor/presentation/widgets/guest_traffic_chart.dart';
import 'package:mehmon/features/floor/presentation/widgets/hall_occupancy_chart.dart';
import 'package:mehmon/features/stats/presentation/controllers/stats_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  static const _sectionSpacing = SizedBox(height: AppSpacing.lg);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final dateText = _formatDate(DateTime.now());

    final summaryAsync = ref.watch(summaryControllerProvider);
    final summary = summaryAsync.valueOrNull;

    if (summaryAsync.isLoading && summary == null) {
      return AppScaffold(
        title: l10n.drawerDashboard,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return AppScaffold(
      title: l10n.drawerDashboard,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpacing.xs),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                l10n.todayDate(dateText),
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            _sectionSpacing,
            DashboardMetricCard(
              title: l10n.expectedGuests,
              value: (summary?.totalGuests ?? 0).toString(),
            ),
            _sectionSpacing,
            Row(
              children: [
                Expanded(
                  child: DashboardDoubleStatCard(
                    title: l10n.guestsInHall,
                    value: (summary?.confirmedBookings ?? 0).toString(),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: DashboardDoubleStatCard(
                    title: l10n.bookingsLabel,
                    value: (summary?.totalBookings ?? 0).toString(),
                  ),
                ),
              ],
            ),
            _sectionSpacing,
            const GuestTrafficChart(),
            _sectionSpacing,
            HallOccupancyChart(occupancy: ((summary?.occupancyRate ?? 0.0) / 100).clamp(0.0, 1.0)),
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
