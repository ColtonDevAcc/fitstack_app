import 'package:FitStack/features/exercise/cubit/exercise_screen/exercise_screen_cubit.dart';
import 'package:FitStack/features/exercise/presentation/organisms/history_tab_view.dart';
import 'package:FitStack/features/exercise/presentation/organisms/program_tab_view.dart';
import 'package:FitStack/features/workout/ui/views/active_workout_view.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              BlocBuilder<ExerciseScreenCubit, ExerciseScreenState>(
                builder: (context, state) {
                  return BasicPageHeader(
                    padding: const EdgeInsets.only(bottom: 20),
                    title: state.index == 0
                        ? 'Programs'
                        : state.index == 1
                            ? 'Workouts'
                            : 'History',
                    color: Theme.of(context).colorScheme.primary,
                    mainAxisAlignment: MainAxisAlignment.end,
                  );
                },
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.surface),
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
                  tabs: const [Text('Programs'), Text('Workouts'), Text('History')],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: DefaultTabController.of(context),
                  children: const [ProgramTabView(), WorkoutTabView(), HistoryTabView()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
