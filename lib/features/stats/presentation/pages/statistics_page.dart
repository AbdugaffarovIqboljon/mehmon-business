import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/stats/presentation/controllers/stats_controller.dart';
import 'package:mehmon/features/stats/presentation/widgets/stat_summary_card.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_chart.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_date_selector.dart';
import 'package:mehmon/features/stats/presentation/widgets/statistics_period_selector.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class StatisticsPage extends ConsumerStatefulWidget {
  const StatisticsPage({super.key});

  @override
  ConsumerState<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends ConsumerState<StatisticsPage> {
  late DateTime _startDate;
  late DateTime _endDate;
  late final ValueNotifier<StatisticsPeriod> _selectedPeriod;

  @override
  void initState() {
    super.initState();
    final today = _today();
    _startDate = today;
    _endDate = today;
    _selectedPeriod = ValueNotifier(StatisticsPeriod.daily);
  }

  @override
  void dispose() {
    _selectedPeriod.dispose();
    super.dispose();
  }

  DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  void _onPeriodChanged(StatisticsPeriod period) {
    if (period == _selectedPeriod.value) return;
    final today = _today();
    final DateTime start;
    switch (period) {
      case StatisticsPeriod.daily:
        start = today;
      case StatisticsPeriod.weekly:
        start = today.subtract(const Duration(days: 6));
      case StatisticsPeriod.monthly:
        start = DateTime(today.year, today.month);
    }
    setState(() {
      _startDate = start;
      _endDate = today;
    });
    _selectedPeriod.value = period;
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
    );
    if (picked != null && mounted) {
      setState(() {
        _startDate = DateTime(
          picked.start.year,
          picked.start.month,
          picked.start.day,
        );
        _endDate = DateTime(
          picked.end.year,
          picked.end.month,
          picked.end.day,
        );
      });
    }
  }

  String _formatDateLabel() {
    String fmt(DateTime d) => '${d.day} ${_monthAbbr(d.month)} ${d.year}';
    if (_startDate == _endDate) return fmt(_startDate);
    return '${fmt(_startDate)} – ${fmt(_endDate)}';
  }

  String _monthAbbr(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return months[month - 1];
  }

  String _toApiDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final reportsArg = (
      startDate: _toApiDate(_startDate),
      endDate: _toApiDate(_endDate),
    );
    final summaryAsync = ref.watch(summaryControllerProvider);
    final reportsAsync = ref.watch(reportsControllerProvider(reportsArg));
    final report = reportsAsync.valueOrNull;

    return AppScaffold(
      title: l10n.statsTitle,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          summaryAsync.when(
            loading: () => GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2.2,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.sm,
              ),
              children: List.generate(
                6,
                (_) => Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            error: (e, _) => Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                e.toString(),
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),
            data: (summary) {
              if (summary == null) return const SizedBox.shrink();
              return GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.2,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.sm,
                ),
                children: [
                  StatSummaryCard(
                    label: 'Jami bronlar',
                    value: '${summary.totalBookings}',
                  ),
                  StatSummaryCard(
                    label: 'Tasdiqlangan',
                    value: '${summary.confirmedBookings}',
                  ),
                  StatSummaryCard(
                    label: 'Kutilmoqda',
                    value: '${summary.pendingBookings}',
                  ),
                  StatSummaryCard(
                    label: 'Mehmonlar',
                    value: '${summary.totalGuests}',
                  ),
                  StatSummaryCard(
                    label: 'Stollar',
                    value: '${summary.totalTables}',
                  ),
                  StatSummaryCard(
                    label: 'Bandlik',
                    value: '${summary.occupancyRate.toStringAsFixed(1)}%',
                  ),
                ],
              );
            },
          ),
          StatisticsDateSelector(
            label: _formatDateLabel(),
            onTap: _pickDateRange,
          ),
          const SizedBox(height: AppSpacing.md),
          ValueListenableBuilder<StatisticsPeriod>(
            valueListenable: _selectedPeriod,
            builder: (context, selectedPeriod, _) {
              return StatisticsPeriodSelector(
                selectedPeriod: selectedPeriod,
                onChanged: _onPeriodChanged,
              );
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          if ((reportsAsync.isLoading || summaryAsync.isLoading) &&
              report == null)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (reportsAsync.hasError)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: Center(
                child: Text(
                  l10n.statsError(reportsAsync.error.toString()),
                ),
              ),
            )
          else
            // TODO: replace with real time-series FlSpots once the API returns per-slot counts.
            const StatisticsChart(dataPoints: []),
        ],
      ),
    );
  }
}
