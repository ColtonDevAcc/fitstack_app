import 'package:FitStack/app/providers/bloc/workout/workout_bloc.dart';
import 'package:FitStack/features/workout/ui/widgets/atoms/workout_list_tile.dart';
import 'package:FitStack/features/workout/ui/widgets/molecules/workout_statistics_snapshot.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double minFontSize = 8;
    const double maxFontSize = 18;

    return CustomScrollView(
      clipBehavior: Clip.none,
      slivers: [
        BlocBuilder<WorkoutBloc, WorkoutState>(
          buildWhen: (previous, current) => previous.workouts != current.workouts || previous.status != current.status,
          builder: (context, state) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SlideInDown(
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(20)),
                        child: const WorkoutStatisticsSnapshot(minFontSize: minFontSize, maxFontSize: maxFontSize),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Workouts',
                                textScaleFactor: .9,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 22),
                              ),
                            ],
                          ),
                          Column(
                            children: state.workouts
                                .map(
                                  (workout) => WorkoutListTile(workout: workout),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
