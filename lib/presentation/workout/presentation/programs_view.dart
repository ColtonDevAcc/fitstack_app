import 'package:FitStack/presentation/workout/presentation/organisms/workout_tab_view.dart';
import 'package:FitStack/presentation/workout/presentation/organisms/history_tab_view.dart';
import 'package:FitStack/presentation/workout/presentation/organisms/program_tab_view.dart';
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
                child: BasicViewHeader(
                  title: "EXERCISE",
                  color: Theme.of(context).colorScheme.primary,
                  trailing: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: TabBar(
                  unselectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold),
                  unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
                  labelColor: Theme.of(context).colorScheme.onBackground,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                    insets: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  tabs: [
                    Text('Programs'),
                    Text('Workouts'),
                    Text('History'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ProgramTabView(),
                    WorkoutTabView(),
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
