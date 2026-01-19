import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformanceTrendChart extends StatelessWidget {
  const PerformanceTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 5,
          minY: 0,
          maxY: 100,

          /// GRID & BORDER (OFF)
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),

          /// AXIS TITLES
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 1:
                      return _bottomLabel('6M');
                    case 3:
                      return _bottomLabel('1Y');
                    case 5:
                      return _bottomLabel('3Y');
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),

          /// LINE DATA
          lineBarsData: [
            /// GLOW LINE (BACKGROUND)
            LineChartBarData(
              spots: _spots,
              isCurved: true,
              barWidth: 6,
              color: Colors.cyanAccent.withOpacity(0.25),
              dotData: FlDotData(show: false),
            ),

            /// MAIN LINE
            LineChartBarData(
              spots: _spots,
              isCurved: true,
              barWidth: 2.6,
              color: Colors.cyanAccent,
              dotData: FlDotData(
                show: true,
                checkToShowDot: (spot, barData) =>
                    spot.x == 5, // last dot only
                getDotPainter: (spot, percent, bar, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.cyanAccent,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.cyanAccent.withOpacity(0.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// DATA POINTS (MATCH IMAGE TREND)
  static const List<FlSpot> _spots = [
    FlSpot(0, 18),
    FlSpot(1, 30),
    FlSpot(2, 28),
    FlSpot(3, 50),
    FlSpot(4, 72),
    FlSpot(5, 92),
  ];

  static Widget _bottomLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.45),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
