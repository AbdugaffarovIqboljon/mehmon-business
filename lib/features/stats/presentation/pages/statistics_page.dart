import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_error_view.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/stats/domain/entities/stats_entity.dart';
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

  static List<FlSpot> _buildSpots(List<ReportBookingEntity> bookings) {
    final grouped = <String, int>{};
    for (final b in bookings) {
      final day = b.date.length >= 10 ? b.date.substring(0, 10) : b.date;
      grouped[day] = (grouped[day] ?? 0) + 1;
    }
    final sortedDates = grouped.keys.toList()..sort();
    return [
      for (int i = 0; i < sortedDates.length; i++)
        FlSpot(i.toDouble(), grouped[sortedDates[i]]!.toDouble()),
    ];
  }

  static List<String> _buildDateLabels(List<ReportBookingEntity> bookings) {
    final uniqueDates = <String>{};
    for (final b in bookings) {
      uniqueDates.add(b.date.length >= 10 ? b.date.substring(0, 10) : b.date);
    }
    final sortedDates = uniqueDates.toList()..sort();
    return sortedDates.map((d) {
      if (d.length >= 10) return '${int.parse(d.substring(8, 10))}';
      return d;
    }).toList();
  }

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
            error: (e, _) => AppErrorView(error: e, compact: true),
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
            const _ChartSkeleton()
          else if (reportsAsync.hasError)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: AppErrorView(
                error: reportsAsync.error!,
                compact: true,
              ),
            )
          else if (report == null || report.bookings.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.lg,
              ),
              child: Center(
                child: Text(
                  "Bu davr uchun ma'lumot yo'q",
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: StatisticsChart(
                dataPoints: _buildSpots(report.bookings),
                dateLabels: _buildDateLabels(report.bookings),
              ),
            ),
        ],
      ),
    );
  }
}

class _ChartSkeleton extends StatelessWidget {
  const _ChartSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
