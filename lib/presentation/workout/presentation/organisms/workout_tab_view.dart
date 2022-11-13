import 'package:FitStack/app/providers/bloc/workout/workout_bloc.dart';
import 'package:FitStack/presentation/workout/presentation/molecules/program_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutTabView extends StatelessWidget {
  const WorkoutTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      slivers: [
        BlocBuilder<WorkoutBloc, WorkoutState>(
          buildWhen: (previous, current) => previous.workouts != current.workouts || previous.status != current.status,
          builder: (context, state) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: state.workouts.isEmpty
                    ? [Center(child: CircularProgressIndicator())]
                    : state.workouts
                        .map(
                          (workout) => GestureDetector(
                            child: ProgramCard(
                              description: workout.name ?? "asdf",
                              title: workout.name ?? "asdf",
                            ),
                          ),
                        )
                        .toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
