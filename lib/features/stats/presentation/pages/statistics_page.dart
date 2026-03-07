import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_chart.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_date_selector.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_period_selector.dart';

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
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          'Statistics',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back, size: 28),
          color: AppColors.textPrimary,
          splashRadius: 22,
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.sm,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          children: [
            StatisticsDateSelector(
              label: '4 Feb 2026',
              onTap: () {},
            ),
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
      ),
    );
  }
}
