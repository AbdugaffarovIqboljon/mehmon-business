import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_chart.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_date_selector.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_period_selector.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late final ValueNotifier<StatisticsPeriod> _selectedPeriod;

  @override
  void initState() {
    super.initState();
    _selectedPeriod = ValueNotifier(StatisticsPeriod.daily);
  }

  @override
  void dispose() {
    _selectedPeriod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.statsTitle,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          StatisticsDateSelector(label: '4 Feb 2026', onTap: () {}),
          const SizedBox(height: AppSpacing.md),
          ValueListenableBuilder<StatisticsPeriod>(
            valueListenable: _selectedPeriod,
            builder: (context, selectedPeriod, _) {
              return StatisticsPeriodSelector(
                selectedPeriod: selectedPeriod,
                onChanged: (period) {
                  if (period == selectedPeriod) return;
                  _selectedPeriod.value = period;
                },
              );
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          const StatisticsChart(),
        ],
      ),
    );
  }
}
