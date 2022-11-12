import 'package:FitStack/presentation/workout/presentation/organisms/custom_tab_view.dart';
import 'package:FitStack/presentation/workout/presentation/organisms/history_tab_view.dart';
import 'package:FitStack/presentation/workout/presentation/organisms/program_tab_view.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  trailing: Icon(FontAwesomeIcons.plus, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TabBar(
                    unselectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                    unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
                    indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    tabs: [
                      Text('Programs'),
                      Text('Workouts'),
                      Text('History'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ProgramTabView(),
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
