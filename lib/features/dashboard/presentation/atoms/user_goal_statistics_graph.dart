import 'package:FitStack/app/repository/user_health_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class UserGoalStatisticsGraph extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final List<dynamic>? data;
  final HealthDataType dataType;
  final double? maxX;
  final double? maxY;
  final double? minY;
  final double? minX;
  final double? width;
  const UserGoalStatisticsGraph({
    Key? key,
    required this.color,
    required this.title,
    required this.subtitle,
    this.data,
    this.maxX,
    this.maxY,
    this.minY,
    this.minX,
    this.width,
    required this.dataType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spotsForMonth = UserHealthRepository().convertListToFlSpots(data: data!, dataType: dataType);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, width != null ? 0 : 10, width != null ? 0 : 3),
      child: Container(
        padding: EdgeInsets.all(10),
        width: width ?? 150,
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
                      spots: spotsForMonth,
                      curveSmoothness: .9,
                      isCurved: true,
                      color: color,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      preventCurveOverShooting: true,
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
                        gradient: LinearGradient(
                          colors: [
                            color.withOpacity(.2),
                            color.withOpacity(.2),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
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
