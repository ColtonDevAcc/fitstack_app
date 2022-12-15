import 'package:FitStack/features/exercise/cubit/exercise_screen/exercise_screen_cubit.dart';
import 'package:FitStack/features/exercise/presentation/organisms/history_tab_view.dart';
import 'package:FitStack/features/exercise/presentation/organisms/program_tab_view.dart';
import 'package:FitStack/features/workout/ui/views/workout_view.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.fromLTRB(8, topPadding, 8, 0),
      child: BlocBuilder<ExerciseScreenCubit, ExerciseScreenState>(
        buildWhen: (previous, current) => previous.index != current.index,
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: BasicPageHeader(
                    title: state.index == 0
                        ? 'Programs'
                        : state.index == 1
                            ? 'Workouts'
                            : 'History',
                    color: Theme.of(context).colorScheme.primary,
                    trailing: GestureDetector(
                      onTap: () {
                        switch (state.index) {
                          case 0:
                            // context.go('/exercise/program');
                            break;
                          case 1:
                            context.push('/exercise/workout/create');
                            break;
                          case 2:
                            // context.go('/exercise/history');
                            break;
                          default:
                        }
                      },
                      child: Container(
                        child: Icon(Icons.add, color: Theme.of(context).colorScheme.primary, size: 30),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: TabBar(
                    onTap: (value) => context.read<ExerciseScreenCubit>().changeIndex(value),
                    unselectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold),
                    unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
                    labelColor: Theme.of(context).colorScheme.onBackground,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                      insets: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                    tabs: const [
                      Text('Programs'),
                      Text('Workouts'),
                      Text('History'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: DefaultTabController.of(context),
                    children: const [
                      ProgramTabView(),
                      WorkoutView(),
                      HistoryTabView(),
                    ],
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
