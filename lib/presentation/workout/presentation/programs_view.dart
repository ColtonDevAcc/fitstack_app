import 'package:FitStack/presentation/workout/presentation/organisms/custom_tab_view.dart';
import 'package:FitStack/presentation/workout/presentation/organisms/history_tab_view.dart';
import 'package:FitStack/presentation/workout/presentation/organisms/workout_tab_view.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';

class ProgramsView extends StatelessWidget {
  const ProgramsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;

    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, topPadding, 15, 0),
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: BasicViewHeader(title: "MY WORKOUTS", color: Theme.of(context).colorScheme.onBackground),
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
      ),
    );
  }
}
