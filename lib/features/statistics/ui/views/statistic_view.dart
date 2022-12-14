import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class StatisticView extends StatelessWidget {
  final List<Log> data;
  const StatisticView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: BasicPageHeader(
              title: "${data.first.type}}",
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(FontAwesome.arrow_left_long, color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Last Updated", style: Theme.of(context).textTheme.headline6),
                    Text(formatter.format(data.last.createdAt), style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("First Updated", style: Theme.of(context).textTheme.headline6),
                    Text(formatter.format(data.last.createdAt), style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                const SizedBox(height: 20),
                UserGoalStatisticsGraph(
                  data: data,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  subtitle: 'Weight Difference',
                  dataType: HealthDataType.WEIGHT,
                ),
                const SizedBox(height: 20),
                //create fl_chart that displays weight by day
                Container(
                  height: 200,
                  width: double.infinity,
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
                  child: BarChart(
                    BarChartData(
                      maxY: data.map((e) => e.value).reduce((a, b) => a > b ? a : b).toDouble(),
                      alignment: BarChartAlignment.spaceAround,
                      barTouchData: BarTouchData(enabled: true),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                "${data[value.toInt()].createdAt.month}/${data[value.toInt()].createdAt.day}",
                                style: Theme.of(context).textTheme.bodyText1,
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(show: false),
                      barGroups: data
                          .map(
                            (e) => BarChartGroupData(
                              x: data.indexOf(e),
                              barRods: [
                                BarChartRodData(
                                  toY: e.value.toDouble(),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
