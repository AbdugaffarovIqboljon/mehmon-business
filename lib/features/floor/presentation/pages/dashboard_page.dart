import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/floor/domain/entities/floor_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/widgets/dashboard_double_stat_card.dart';
import 'package:mehmon/features/floor/presentation/widgets/dashboard_metric_card.dart';
import 'package:mehmon/features/floor/presentation/widgets/guest_traffic_chart.dart';
import 'package:mehmon/features/floor/presentation/widgets/hall_occupancy_chart.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  static const _sectionSpacing = SizedBox(height: AppSpacing.lg);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dateText = _formatDate(DateTime.now());

    final tables = ref.watch(floorControllerProvider).valueOrNull ?? [];
    final totalTables = tables.length;
    final availableTables = tables.where((t) => t.isAvailable).length;
    final occupiedTables = tables.where((t) => t.isOccupied).length;
    final occupancy =
        totalTables == 0 ? 0.0 : occupiedTables / totalTables;

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
                    value: availableTables.toString(),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: DashboardDoubleStatCard(
                    title: AppLocalizations.of(context)!.bookingsLabel,
                    value: totalTables.toString(),
                  ),
                ),
              ],
            ),
            _sectionSpacing,
            const GuestTrafficChart(),
            _sectionSpacing,
            HallOccupancyChart(occupancy: occupancy),
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
