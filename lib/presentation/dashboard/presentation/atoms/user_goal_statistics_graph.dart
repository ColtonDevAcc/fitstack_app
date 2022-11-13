import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserGoalStatisticsGraph extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final List<FlSpot>? spots;
  final double? maxX;
  final double? maxY;
  final double? minY;
  final double? minX;
  const UserGoalStatisticsGraph(
      {Key? key, required this.color, required this.title, required this.subtitle, this.spots, this.maxX, this.maxY, this.minY, this.minX})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 3),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 150,
        height: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(1, 3),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(.5),
                  ),
              textScaleFactor: .9,
            ),
            SizedBox(height: 5),
            Expanded(
              child: LineChart(
                LineChartData(
                  maxX: maxX,
                  maxY: maxY,
                  minY: minY,
                  minX: minX,
                  clipData: FlClipData.none(),
                  gridData: FlGridData(
                    show: false,
                  ),
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots ?? [],
                      isCurved: true,
                      preventCurveOverShooting: true,
                      color: color,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                          radius: 1,
                          color: color,
                          strokeWidth: 1,
                          strokeColor: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: color.withOpacity(.2),
                      ),
                    ),
                  ],
                ),
                swapAnimationDuration: Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ),
            ),
          ],
        ),
      ),
    );
  }
}
