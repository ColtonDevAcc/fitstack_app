import 'package:FitStack/presentation/dashboard/presentation/organisms/workout_reccommendations_list.dart';
import 'package:FitStack/presentation/dashboard/presentation/organisms/statistics_dashboard.dart';
import 'package:FitStack/widgets/atoms/profile_circular_avatar.dart';
import 'package:flutter/material.dart';

import 'organisms/statistics_dashboard.dart';

class DashBoard_View extends StatefulWidget {
  DashBoard_View({Key? key}) : super(key: key);

  @override
  State<DashBoard_View> createState() => _DashBoard_ViewState();
}

class _DashBoard_ViewState extends State<DashBoard_View> {
  int currentIndex = 0;
  final PageController pageController = PageController(viewportFraction: 0.5);
  //final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height + 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "HOW YOUR DAY LOOKS?",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Profile_Circular_Avatar(
                        maxRadius: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Stats",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Statistics_Dashboard(),
                ),
                Text(
                  "Daily Workouts",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Workout_Recommendation_List(pageController: pageController),
                ),
                Text(
                  "Progress",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    height: 200,
                    width: 100,
                    color: Colors.red[300],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
