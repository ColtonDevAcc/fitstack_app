import 'package:FitStack/app/providers/cubit/user_statistic/user_statistic_cubit.dart';
import 'package:FitStack/presentation/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProgressSnapshotList extends StatelessWidget {
  const UserProgressSnapshotList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatisticCubit, UserStatisticState>(
      buildWhen: (previous, current) =>
          previous.userStatistic != current.userStatistic ||
          previous.status != current.status ||
          previous.weightDifference != current.weightDifference ||
          previous.weightDifference != current.weightDifference ||
          previous.weightDifference != current.weightDifference,
      builder: (context, state) {
        return state.status != UserStatisticsStatus.loaded
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(padding: EdgeInsets.zero, scrollDirection: Axis.horizontal, children: [
                if (state.userStatistic.weight_log != null && state.userStatistic.weight_log!.length > 2)
                  UserGoalStatisticsGraph(
                    spots: state.userStatistic.weight_log
                        ?.map((e) => FlSpot(e.created_at!.difference(DateTime.now()).inHours.toDouble(), e.weight.roundToDouble()))
                        .toList(),
                    color: Theme.of(context).colorScheme.primary,
                    subtitle: 'Weight Difference',
                    title: '${state.weightDifference} LBS',
                  ),
                if (state.userStatistic.bmi_log != null && state.userStatistic.weight_log!.length > 2)
                  UserGoalStatisticsGraph(
                    spots: state.userStatistic.bmi_log
                        ?.map((e) => FlSpot(e.created_at!.difference(DateTime.now()).inHours.toDouble(), e.bmi.roundToDouble()))
                        .toList(),
                    color: Theme.of(context).colorScheme.secondary,
                    subtitle: 'BMI Difference',
                    title: '${state.bmiDifference} BMI',
                  ),
                if (state.userStatistic.body_fat_log != null && state.userStatistic.body_fat_log!.length > 2)
                  UserGoalStatisticsGraph(
                    maxY: state.userStatistic.body_fat_log!.last.body_fat + 8,
                    spots: state.userStatistic.body_fat_log
                        ?.map((e) => FlSpot(e.created_at!.difference(DateTime.now()).inHours.toDouble(), e.body_fat.roundToDouble()))
                        .toList(),
                    color: Theme.of(context).colorScheme.error,
                    subtitle: 'Body Fat Difference',
                    title: '${state.fatPercentageDifference} BMI',
                  ),
              ]);
      },
    );
  }
}
