import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/providers/bloc/user_statistics/user_statistics_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health/health.dart';

class UserProgressSnapshotList extends StatelessWidget {
  const UserProgressSnapshotList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatisticsBloc, UserStatisticsState>(
      builder: (context, state) {
        return state.status != UserStatisticsStatus.loaded && state.userStatistic != UserStatistic.empty()
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    children: [
                      if (state.userStatistic.weightLogs != null && state.userStatistic.weightLogs!.length > 2)
                        GestureDetector(
                          onTap: () {
                            context.read<UserStatisticsBloc>().add(const UserStatisticSelected(HealthDataType.WEIGHT));
                            context.push('/user/statistic', extra: {'data': state.userStatistic.weightLogs});
                          },
                          child: UserGoalStatisticsGraph(
                            data: state.userStatistic.weightLogs,
                            color: Theme.of(context).colorScheme.primary,
                            subtitle: 'Weight Difference',
                            dataType: HealthDataType.WEIGHT,
                          ),
                        ),
                      if (state.userStatistic.bodyMassIndexLogs != null && state.userStatistic.bodyMassIndexLogs!.length > 2)
                        GestureDetector(
                          onTap: () {
                            context.read<UserStatisticsBloc>().add(const UserStatisticSelected(HealthDataType.BODY_MASS_INDEX));
                            context.push('/user/statistic', extra: {'data': state.userStatistic.weightLogs});
                          },
                          child: UserGoalStatisticsGraph(
                            data: state.userStatistic.bodyMassIndexLogs,
                            color: Theme.of(context).colorScheme.secondary,
                            subtitle: 'BMI Difference',
                            dataType: HealthDataType.BODY_MASS_INDEX,
                          ),
                        ),
                      if (state.userStatistic.bodyFatPercentageLogs != null && state.userStatistic.bodyFatPercentageLogs!.length > 2)
                        GestureDetector(
                          onTap: () {
                            context.read<UserStatisticsBloc>().add(const UserStatisticSelected(HealthDataType.BODY_FAT_PERCENTAGE));
                            context.push('/user/statistic', extra: {'data': state.userStatistic.weightLogs});
                          },
                          child: UserGoalStatisticsGraph(
                            data: state.userStatistic.bodyFatPercentageLogs,
                            color: Theme.of(context).colorScheme.error,
                            subtitle: 'Body Fat Difference',
                            dataType: HealthDataType.BODY_FAT_PERCENTAGE,
                          ),
                        ),
                      if (state.userStatistic.activeEnergyBurned != null && state.userStatistic.activeEnergyBurned!.length > 2)
                        GestureDetector(
                          onTap: () {
                            context.read<UserStatisticsBloc>().add(const UserStatisticSelected(HealthDataType.ACTIVE_ENERGY_BURNED));
                            context.push('/user/statistic', extra: {'data': state.userStatistic.weightLogs});
                          },
                          child: UserGoalStatisticsGraph(
                            data: state.userStatistic.activeEnergyBurned,
                            color: Theme.of(context).colorScheme.error,
                            subtitle: 'Active Energy Difference',
                            dataType: HealthDataType.ACTIVE_ENERGY_BURNED,
                          ),
                        ),
                    ],
                  ),
                  //TODO: wrap around container
                  if (state.snapshotUpdateStatus == StatisticsSnapshotUpdateStatus.loading) const Positioned(child: LinearProgressIndicator()),
                ],
              );
      },
    );
  }
}
