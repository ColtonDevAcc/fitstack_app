import 'package:FitStack/app/providers/bloc/user_statistics/user_statistics_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:FitStack/features/statistics/ui/widgets/atoms/featured_feedback_report_card.dart';
import 'package:FitStack/features/statistics/ui/widgets/atoms/statistic_value_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';

class ReportTabView extends StatelessWidget {
  const ReportTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        const FeaturedFeedbackReportCard(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatisticValueCard(
              title: 'Exercise',
              value: '12',
              color: Theme.of(context).colorScheme.secondaryContainer,
              emoji: ':fire:',
            ),
            StatisticValueCard(
              title: '809',
              value: 'Calories',
              color: Theme.of(context).colorScheme.errorContainer,
              emoji: ':muscle:',
            ),
            StatisticValueCard(
              title: '60',
              value: 'minutes',
              color: Theme.of(context).colorScheme.tertiaryContainer,
              emoji: ':stopwatch:',
            ),
          ],
        ),
        //fl grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: UserGoalStatisticsGraph(
            color: Theme.of(context).colorScheme.secondary,
            dataType: HealthDataType.ACTIVE_ENERGY_BURNED,
            subtitle: 'stuff',
            title: 'Activities',
            updating: false,
            width: double.infinity,
            data: context.watch<UserStatisticsBloc>().state.userStatistic.activeEnergyBurned,
          ),
        ),
      ],
    );
  }
}
