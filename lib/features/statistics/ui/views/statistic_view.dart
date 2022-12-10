import 'package:FitStack/app/providers/bloc/user_statistics/user_statistics_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/properties/mass.dart';
import 'package:intl/intl.dart';

class StatisticView extends StatelessWidget {
  const StatisticView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: BasicPageHeader(
              title: "Weight",
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(FontAwesome.arrow_left_long, color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ),
          BlocBuilder<UserStatisticsBloc, UserStatisticsState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Last Updated", style: Theme.of(context).textTheme.headline6),
                        Text("${formatter.format(state.userStatistic.weight_log?.last.updated_at ?? DateTime.now())}",
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("First Updated", style: Theme.of(context).textTheme.headline6),
                        Text("${formatter.format(state.userStatistic.weight_log?.last.created_at ?? DateTime.now())}",
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                    SizedBox(height: 20),
                    UserGoalStatisticsGraph(
                      data: state.userStatistic.weight_log,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.primary,
                      subtitle: 'Weight Difference',
                      title: '${state.userStatistic.weight_log!.first.weight - state.userStatistic.weight_log!.last.weight}',
                      dataType: HealthDataType.WEIGHT,
                    ),
                    SizedBox(height: 20),
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
                            offset: Offset(1, 3),
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: BarChart(
                        BarChartData(
                          maxY: (state.userStatistic.weight_log
                                      ?.reduce((value, element) => value.weight > element.weight ? value : element)
                                      .weight
                                      .convertFromTo(MASS.kilograms, MASS.pounds)! ??
                                  0) *
                              1.5,
                          alignment: BarChartAlignment.spaceAround,
                          barTouchData: BarTouchData(enabled: true),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    "${state.userStatistic.weight_log![value.toInt()].created_at!.month}/${state.userStatistic.weight_log![value.toInt()].created_at!.day}",
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
                          barGroups: state.userStatistic.weight_log
                              ?.map(
                                (e) => BarChartGroupData(
                                  x: state.userStatistic.weight_log!.indexOf(e),
                                  barRods: [
                                    BarChartRodData(
                                      toY: e.weight.convertFromTo(MASS.kilograms, MASS.pounds)!,
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
              );
            },
          )
        ],
      ),
    );
  }
}
