import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/presentation/dashboard/presentation/molecules/user_goal_graphs_list.dart';
import 'package:FitStack/presentation/dashboard/presentation/molecules/workout_recommendations%20_list.dart';
import 'package:FitStack/presentation/dashboard/presentation/molecules/statistics_dashboard.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicViewHeader(
                title: "DASHBOARD",
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ProfileAvatar(
                    onTap: () => GoRouter.of(context).push("/user/profile"),
                    profileUrl: '',
                    withBorder: false,
                    maxRadius: 17,
                  ),
                ),
              ),
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
                child: UserGoalGraphsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
