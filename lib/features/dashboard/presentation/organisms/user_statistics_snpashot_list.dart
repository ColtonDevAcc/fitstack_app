import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/providers/bloc/user_statistics/user_statistics_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:units_converter/units_converter.dart';

class UserProgressSnapshotList extends StatelessWidget {
  const UserProgressSnapshotList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatisticsBloc, UserStatisticsState>(
      builder: (context, state) {
        return state.status != UserStatisticsStatus.loaded && state.userStatistic != UserStatistic.empty()
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                children: [
                  if (state.userStatistic.weight_log != null && state.userStatistic.weight_log!.length > 2)
                    GestureDetector(
                      onTap: () => context.push('/user/weight'),
                      child: UserGoalStatisticsGraph(
                        spots: state.userStatistic.weight_log
                            ?.map((e) => FlSpot(
                                  e.created_at!.difference(DateTime.now()).inHours.toDouble(),
                                  e.weight.convertFromTo(MASS.kilograms, MASS.pounds)!,
                                ))
                            .toList(),
                        color: Theme.of(context).colorScheme.primary,
                        subtitle: 'Weight Difference',
                        title: '${(state.userStatistic.weight_log!.first.weight - state.userStatistic.weight_log!.last.weight).roundToDouble()} LBS',
                      ),
                    ),
                  if (state.userStatistic.bmi_log != null && state.userStatistic.weight_log!.length > 2)
                    GestureDetector(
                      // onTap: () => Navigator.of(context).pushNamed('/weight'),
                      child: UserGoalStatisticsGraph(
                        spots: state.userStatistic.bmi_log
                            ?.map((e) => FlSpot(
                                  e.created_at!.difference(DateTime.now()).inHours.toDouble(),
                                  e.bmi,
                                ))
                            .toList(),
                        color: Theme.of(context).colorScheme.secondary,
                        subtitle: 'BMI Difference',
                        title: '${(state.userStatistic.bmi_log!.first.bmi - state.userStatistic.bmi_log!.last.bmi).roundToDouble()} BMI',
                      ),
                    ),
                  if (state.userStatistic.body_fat_log != null && state.userStatistic.body_fat_log!.length > 2)
                    GestureDetector(
                      // onTap: () => Navigator.of(context).pushNamed('/weight'),
                      child: UserGoalStatisticsGraph(
                        maxY: state.userStatistic.body_fat_log!.last.body_fat + 8,
                        spots: state.userStatistic.body_fat_log
                            ?.map((e) => FlSpot(
                                  e.created_at!.difference(DateTime.now()).inHours.toDouble(),
                                  e.body_fat,
                                ))
                            .toList(),
                        color: Theme.of(context).colorScheme.error,
                        subtitle: 'Body Fat Difference',
                        title: '${(state.userStatistic.body_fat_log!.first.body_fat - state.userStatistic.body_fat_log!.last.body_fat).round()} %',
                      ),
                    ),
                  if (state.userStatistic.active_energy != null && state.userStatistic.active_energy!.length > 2)
                    GestureDetector(
                      // onTap: () => Navigator.of(context).pushNamed('/weight'),
                      child: UserGoalStatisticsGraph(
                        maxY: state.userStatistic.active_energy!.last.active_energy + 8,
                        spots: state.userStatistic.active_energy
                            ?.map((e) => FlSpot(
                                  e.created_at!.difference(DateTime.now()).inHours.toDouble(),
                                  e.active_energy,
                                ))
                            .toList(),
                        color: Theme.of(context).colorScheme.error,
                        subtitle: 'Active Energy Difference',
                        title:
                            '${(state.userStatistic.active_energy!.first.active_energy - state.userStatistic.active_energy!.last.active_energy).round()} %',
                      ),
                    ),
                  if (state.userStatistic.active_minutes_log != null && state.userStatistic.active_minutes_log!.length > 2)
                    GestureDetector(
                      // onTap: () => Navigator.of(context).pushNamed('/weight'),
                      child: UserGoalStatisticsGraph(
                        maxY: state.userStatistic.active_minutes_log!.last.active_minutes + 8,
                        spots: state.userStatistic.active_minutes_log
                            ?.map((e) => FlSpot(
                                  e.created_at.difference(DateTime.now()).inHours.toDouble(),
                                  e.active_minutes,
                                ))
                            .toList(),
                        color: Theme.of(context).colorScheme.error,
                        subtitle: 'Active Minutes Difference',
                        title:
                            '${(state.userStatistic.active_minutes_log!.first.active_minutes - state.userStatistic.active_minutes_log!.last.active_minutes).round()} %',
                      ),
                    ),
                ],
              );
      },
    );
  }
}
