import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/stats/presentation/controllers/stats_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

/// Placeholder stats page.
class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(statsControllerProvider);

    return AppScaffold(
      title: AppLocalizations.of(context)!.statsTitle,
      body: statsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, _) => Center(
              child: Text(
                AppLocalizations.of(context)!.statsError(error.toString()),
              ),
            ),
        data:
            (stats) => Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatCard(
                    label: AppLocalizations.of(context)!.statsTotalBookings,
                    value: stats.totalBookings.toString(),
                    icon: Icons.calendar_today,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _StatCard(
                    label: AppLocalizations.of(context)!.statsTotalGuests,
                    value: stats.totalGuests.toString(),
                    icon: Icons.people,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _StatCard(
                    label: AppLocalizations.of(context)!.statsOccupancyRate,
                    value: '${(stats.occupancyRate * 100).toStringAsFixed(0)}%',
                    icon: Icons.bar_chart,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _StatCard(
                    label: AppLocalizations.of(context)!.statsRevenue,
                    value: '\$${stats.revenue.toStringAsFixed(2)}',
                    icon: Icons.attach_money,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: AppSpacing.lg),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodySmall),
                Text(value, style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
