import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class StatisticsChart extends StatelessWidget {
  const StatisticsChart({super.key});

  static const _axisLabelByX = <int, String>{
    0: '10:00',
    1: '12:00',
    2: '14:00',
    3: '16:00',
    4: '18:00',
  };

  static const _spots = <FlSpot>[
    FlSpot(0, 2),
    FlSpot(0.35, 2.35),
    FlSpot(0.7, 2.25),
    FlSpot(1, 1.85),
    FlSpot(1.35, 2.25),
    FlSpot(1.75, 3.55),
    FlSpot(2, 3.35),
    FlSpot(2.35, 3.45),
    FlSpot(2.7, 2.15),
    FlSpot(3, 2.6),
    FlSpot(3.35, 1.95),
    FlSpot(3.7, 3.25),
    FlSpot(4, 3.35),
  ];

  static const _selectedSpotIndex = 12;

  static bool _isWholeTick(double value) {
    const epsilon = 1e-6;
    return (value - value.roundToDouble()).abs() < epsilon;
  }

  @override
  Widget build(BuildContext context) {
    final selectedSpot = _spots[_selectedSpotIndex];
    final axisStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 10.5,
        );

    return RepaintBoundary(
      child: SizedBox(
        height: 204,
        child: IgnorePointer(
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 4,
              minY: 0,
              maxY: 4.05,
              lineTouchData: const LineTouchData(
                enabled: false,
                handleBuiltInTouches: false,
              ),
              gridData: FlGridData(
                drawHorizontalLine: false,
                verticalInterval: 1,
                checkToShowVerticalLine: (value) =>
                    _isWholeTick(value) &&
                    _axisLabelByX.containsKey(value.round()),
                getDrawingVerticalLine: (_) => FlLine(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                leftTitles: const AxisTitles(),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      if (!_isWholeTick(value)) {
                        return const SizedBox.shrink();
                      }
                      final label = _axisLabelByX[value.round()];
                      if (label == null) return const SizedBox.shrink();
                      return SideTitleWidget(
                        meta: meta,
                        space: 6,
                        fitInside: SideTitleFitInsideData(
                          enabled: true,
                          parentAxisSize: meta.parentAxisSize,
                          axisPosition: meta.axisPosition,
                          distanceFromEdge: 8,
                        ),
                        child: Text(
                          label,
                          style: axisStyle,
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.primary.withValues(alpha: 0.75),
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: _spots,
                  isCurved: true,
                  preventCurveOverShooting: true,
                  curveSmoothness: 0.3,
                  color: AppColors.primary,
                  barWidth: 1.8,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    checkToShowDot: (spot, _) => spot == selectedSpot,
                    getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                      radius: 6.8,
                      color: Colors.white,
                      strokeWidth: 5,
                      strokeColor: AppColors.primary,
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
              extraLinesData: ExtraLinesData(
                verticalLines: [
                  VerticalLine(
                    x: selectedSpot.x,
                    color: AppColors.primary.withValues(alpha: 0.34),
                    strokeWidth: 1,
                  ),
                ],
              ),
            ),
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutCubic,
          ),
        ),
      ),
    );
  }
}
