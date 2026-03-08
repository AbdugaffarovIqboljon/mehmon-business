import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class GuestTrafficChart extends StatelessWidget {
  const GuestTrafficChart({super.key});

  static const List<FlSpot> _spots = [
    FlSpot(10, 34),
    FlSpot(11, 36),
    FlSpot(12, 33),
    FlSpot(13, 45),
    FlSpot(14, 44),
    FlSpot(15, 36),
    FlSpot(16, 38),
    FlSpot(17, 33),
    FlSpot(18, 43),
    FlSpot(19, 36),
    FlSpot(20, 42),
  ];

  static const _xTickLabels = <int, String>{
    10: '10:00',
    12: '12:00',
    14: '14:00',
    16: '16:00',
    18: '18:00',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.md,
          AppSpacing.lg,
          AppSpacing.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.guestTrafficTitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            AspectRatio(
              aspectRatio: 2.15,
              child: RepaintBoundary(child: LineChart(_chartData(theme))),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData _chartData(ThemeData theme) {
    return LineChartData(
      minX: 10,
      maxX: 20,
      minY: 20,
      maxY: 50,
      clipData: const FlClipData.all(),
      gridData: FlGridData(
        drawHorizontalLine: false,
        getDrawingVerticalLine: (value) {
          if (!_xTickLabels.containsKey(value.toInt()) || value % 1 != 0) {
            return const FlLine(color: Colors.transparent);
          }
          return FlLine(
            color: AppColors.primary.withValues(alpha: 0.15),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(),
        rightTitles: const AxisTitles(),
        leftTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2,
            reservedSize: 36,
            getTitlesWidget: (value, meta) {
              final label = value % 1 == 0 ? _xTickLabels[value.toInt()] : null;
              if (label == null) return const SizedBox.shrink();
              return SideTitleWidget(
                meta: meta,
                child: Text(
                  label,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        border: Border(
          bottom: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.8),
            width: 1.2,
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _spots,
          isCurved: true,
          curveSmoothness: 0.3,
          color: AppColors.primary,
          barWidth: 1.8,
          isStrokeCapRound: true,
          dotData: FlDotData(
            checkToShowDot: (spot, barData) =>
                spot.x == _spots.last.x && spot.y == _spots.last.y,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
                  radius: 6.5,
                  color: AppColors.primary,
                  strokeColor: theme.colorScheme.surface,
                  strokeWidth: 4,
                ),
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary.withValues(alpha: 0.14),
                AppColors.primary.withValues(alpha: 0.02),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
