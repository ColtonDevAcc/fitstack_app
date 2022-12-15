import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health/health.dart';

class UserProgressSnapshotList extends StatelessWidget {
  final bool loading;
  final bool updating;
  final UserStatistic userStatistic;
  const UserProgressSnapshotList({Key? key, required this.loading, required this.updating, required this.userStatistic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            children: [
              if (userStatistic.weightLogs != null && userStatistic.weightLogs!.length > 2)
                GestureDetector(
                  onTap: () => context.push('/user/statistic', extra: {'data': userStatistic.weightLogs}),
                  child: UserGoalStatisticsGraph(
                    data: userStatistic.weightLogs,
                    color: Theme.of(context).colorScheme.primary,
                    subtitle: 'Weight Difference',
                    dataType: HealthDataType.WEIGHT,
                    updating: updating,
                  ),
                ),
              if (userStatistic.bodyMassIndexLogs != null && userStatistic.bodyMassIndexLogs!.length > 2)
                GestureDetector(
                  onTap: () => context.push('/user/statistic', extra: {'data': userStatistic.weightLogs}),
                  child: UserGoalStatisticsGraph(
                    data: userStatistic.bodyMassIndexLogs,
                    color: Theme.of(context).colorScheme.secondary,
                    subtitle: 'BMI Difference',
                    dataType: HealthDataType.BODY_MASS_INDEX,
                    updating: updating,
                  ),
                ),
              if (userStatistic.bodyFatPercentageLogs != null && userStatistic.bodyFatPercentageLogs!.length > 2)
                GestureDetector(
                  onTap: () => context.push('/user/statistic', extra: {'data': userStatistic.weightLogs}),
                  child: UserGoalStatisticsGraph(
                    data: userStatistic.bodyFatPercentageLogs,
                    color: Theme.of(context).colorScheme.error,
                    subtitle: 'Body Fat Difference',
                    dataType: HealthDataType.BODY_FAT_PERCENTAGE,
                    updating: updating,
                  ),
                ),
              if (userStatistic.activeEnergyBurned != null && userStatistic.activeEnergyBurned!.length > 2)
                GestureDetector(
                  onTap: () => context.push('/user/statistic', extra: {'data': userStatistic.weightLogs}),
                  child: UserGoalStatisticsGraph(
                    data: userStatistic.activeEnergyBurned,
                    color: Theme.of(context).colorScheme.error,
                    subtitle: 'Active Energy Difference',
                    dataType: HealthDataType.ACTIVE_ENERGY_BURNED,
                    updating: updating,
                  ),
                ),
            ],
          );
  }
}
