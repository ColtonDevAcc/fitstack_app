import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/providers/cubit/user_statistic/user_statistic_cubit.dart';
import 'package:FitStack/presentation/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:FitStack/presentation/dashboard/presentation/molecules/workout_recommendations%20_list.dart';
import 'package:FitStack/presentation/dashboard/presentation/molecules/statistics_dashboard.dart';
import 'package:FitStack/presentation/profile/cubit/profile_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.5);
    const double bottomPadding = 17;
    const double topPadding = 25;
    const double textLabelScale = 1.2;
    TextStyle labelTextStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.bold,
        );

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      child: SafeArea(
        child: Column(
          children: [
            BasicViewHeader(
              title: "DASHBOARD",
              trailing: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return ProfileAvatar(
                      onTap: () => context.go("/user"),
                      avatar: context.read<AppBloc>().state.user?.profile.avatar,
                      withBorder: false,
                      maxRadius: 17,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, topPadding - 5, 0, 0),
                    child: Text(
                      "Stats",
                      textScaleFactor: textLabelScale,
                      style: labelTextStyle,
                    ),
                  ),
                  Statistics_Dashboard(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
                    child: Text(
                      "Daily Workouts",
                      textScaleFactor: textLabelScale,
                      style: labelTextStyle,
                    ),
                  ),
                  Workout_Recommendation_List(pageController: pageController),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
                    child: Text(
                      "Progress",
                      textScaleFactor: textLabelScale,
                      style: labelTextStyle,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .2,
                    child: BlocBuilder<UserStatisticCubit, UserStatisticState>(
                      buildWhen: (previous, current) => previous.userStatistic != current.userStatistic,
                      builder: (context, state) {
                        var bmiGained;
                        var weightGained;
                        var bodyFatGained;

                        if (state.status == UserStatisticsStatus.loaded) {
                          weightGained = context.read<UserStatisticCubit>().getWeightDifference();
                          bmiGained = context.read<UserStatisticCubit>().getBMIRangeDifference();
                          bodyFatGained = context.read<UserStatisticCubit>().getFatPercentageDifference();
                        }

                        return ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          children: state.status == UserStatisticsStatus.loading
                              ? [
                                  Center(
                                    child: CircularProgressIndicator(),
                                  )
                                ]
                              : [
                                  UserGoalStatisticsGraph(
                                    spots: state.userStatistic.weight_log?.map((e) => FlSpot(e.created_at.day.toDouble(), e.weight)).toList() ?? [],
                                    color: Theme.of(context).colorScheme.primary,
                                    subtitle: 'Weight Gained',
                                    title: '$weightGained LBS',
                                  ),
                                  UserGoalStatisticsGraph(
                                    spots: state.userStatistic.bmi_log?.map((e) => FlSpot(e.created_at.day.toDouble(), e.bmi)).toList() ?? [],
                                    color: Theme.of(context).colorScheme.primary,
                                    subtitle: 'BMI Lost',
                                    title: '$bmiGained BMI',
                                  ),
                                  UserGoalStatisticsGraph(
                                    spots: state.userStatistic.bmi_log?.map((e) => FlSpot(e.created_at.day.toDouble(), e.bmi)).toList() ?? [],
                                    color: Theme.of(context).colorScheme.primary,
                                    subtitle: 'Body Fat Lost',
                                    title: '$bodyFatGained BMI',
                                  ),
                                ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
