import 'package:FitStack/presentation/dashboard/presentation/molecules/goal_progress_graph.dart';
import 'package:FitStack/presentation/dashboard/presentation/organisms/workout_recommendations%20_list.dart';
import 'package:FitStack/presentation/dashboard/presentation/organisms/statistics_dashboard.dart';
import 'package:flutter/material.dart';
import 'organisms/statistics_dashboard.dart';

class DashBoard_View extends StatelessWidget {
  DashBoard_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.5);
    const double bottomPadding = 10;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "HOW'S YOUR DAY LOOK?",
                    //TODO: need to use auto resize package
                    textScaleFactor: 1.3,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, topPadding - 5, 0, bottomPadding),
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
              GoalProgressGraph(),
            ],
          ),
        ),
      ),
    );
  }
}
