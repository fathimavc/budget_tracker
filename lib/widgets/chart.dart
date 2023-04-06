import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker_app/theme/colors.dart';

List<Color> gradientColors = [primary];

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 2:
      text = '1';
      break;
    case 5:
      text = '11';
      break;
    case 8:
      text = '21';
      break;

    default:
      return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '10k';
      break;
    case 3:
      text = '50k';
      break;
    case 5:
      text = '100k';
      break;

    default:
      return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
      text,
      style: style,
    ),
  );
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.1,
          );
        }),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: leftTitleWidgets,
            interval: 1),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          const FlSpot(0, 3),
          const FlSpot(2.6, 2),
          const FlSpot(4.9, 5),
          const FlSpot(6.8, 3.1),
          const FlSpot(8, 4),
          const FlSpot(9.5, 3),
          const FlSpot(11, 4),
        ],
        isCurved: true,
        color: primary,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
    ],
  );
}
