import 'package:FitStack/presentation/workout/presentation/organisms/custom_tab_view.dart';
import 'package:FitStack/presentation/workout/presentation/organisms/history_tab_view.dart';
import 'package:FitStack/presentation/workout/presentation/organisms/workout_tab_view.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.fromLTRB(15, topPadding, 15, 0),
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                "MY WORKOUTS?",
                textScaleFactor: 1.3,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TabBar(
                  unselectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  unselectedLabelColor: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
                  indicator: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  tabs: [
                    Text('Saved'),
                    Text('Custom'),
                    Text('History'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  WorkoutTabView(),
                  CustomTabView(),
                  HistoryTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
