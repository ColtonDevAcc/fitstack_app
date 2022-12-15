import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:animated_loading_border/animated_loading_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/health.dart';

class UserGoalStatisticsGraph extends StatelessWidget {
  final Color color;
  final String subtitle;
  final List<Log>? data;
  final HealthDataType dataType;
  final double? width;
  final bool updating;
  const UserGoalStatisticsGraph({
    Key? key,
    required this.color,
    required this.subtitle,
    required this.dataType,
    required this.updating,
    this.data,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final difference = data!.first.value - data!.last.value;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, width != null ? 0 : 10, width != null ? 0 : 3),
      child: AnimatedLoadingBorder(
        cornerRadius: 19,
        borderWidth: 3,
        borderColor: Theme.of(context).colorScheme.primary,
        trailingBorderColor: Theme.of(context).colorScheme.primary,
        controller: (controller) => updating ? controller.repeat() : controller.stop(),
        child: Container(
          padding: const EdgeInsets.all(10),
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
                offset: const Offset(1, 3),
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (difference.isNegative)
                Row(
                  children: [
                    Icon(FontAwesomeIcons.arrowDown, size: 15, color: Theme.of(context).colorScheme.error),
                    Text(
                      (difference * -1).toStringAsFixed(1),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.arrowUp, size: 15, color: Colors.green),
                    Text(difference.toStringAsFixed(2), style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.normal, color: Theme.of(context).colorScheme.onSurface.withOpacity(.5)),
                textScaleFactor: .9,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      enabled: true,
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Theme.of(context).colorScheme.surface,
                        tooltipRoundedRadius: 8,
                        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                          return touchedBarSpots.map(
                            (barSpot) {
                              final DateTime today = DateTime.now();
                              final flSpot = barSpot;
                              if (flSpot.x == today.day) {
                                return LineTooltipItem(
                                  "${flSpot.y.toStringAsFixed(1)} recorded Today",
                                  TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.bold),
                                );
                              } else if (flSpot.x == today.day + 1) {
                                return LineTooltipItem(
                                  "${flSpot.y.toStringAsFixed(1)} recorded Yesterday",
                                  TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.bold),
                                );
                              } else {
                                return LineTooltipItem(
                                  ((today.difference(DateTime(today.year, today.month, flSpot.x.toInt())).inDays) * -1).isNegative
                                      ? "not recorded"
                                      : "${flSpot.y.toStringAsFixed(1)} recorded ${(today.difference(DateTime(today.year, today.month, flSpot.x.toInt())).inDays) * -1} days ago",
                                  TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.bold),
                                );
                              }
                            },
                          ).toList();
                        },
                      ),
                    ),
                    clipData: FlClipData.none(),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    //determine min y and max y values from spotsForMonth to have some padding on the top and bottom of the graph
                    minY: data!.map((e) => e.value).reduce((value, element) => value < element ? value : element) - 1,
                    maxY: data!.map((e) => e.value).reduce((value, element) => value > element ? value : element) + 1,
                    lineBarsData: [
                      LineChartBarData(
                        isStrokeJoinRound: true,
                        spots: data!.map((e) {
                          final DateTime today = DateTime.now().toUtc();
                          return FlSpot(
                            today.difference(DateTime(e.createdAt.year, e.createdAt.month, e.createdAt.day)).inDays * -1 + 1,
                            e.value.toDouble(),
                          );
                        }).toList(),
                        isCurved: true,
                        color: color,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          color: color.withOpacity(.2),
                          gradient: LinearGradient(
                            colors: [color.withOpacity(.2), color.withOpacity(.2), Colors.transparent],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
