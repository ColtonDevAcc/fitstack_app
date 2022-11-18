import 'package:FitStack/app/models/workout/workout_model.dart';
import 'package:FitStack/app/providers/bloc/workout/workout_bloc.dart';
import 'package:FitStack/features/exercise/presentation/atoms/workout_list_tile.dart';
import 'package:FitStack/features/exercise/presentation/molecules/workout_statistics_snapshot.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutTabView extends StatelessWidget {
  const WorkoutTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double minFontSize = 8;
    const double maxFontSize = 16;

    return CustomScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
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
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: WorkoutStatisticsSnapshot(minFontSize: minFontSize, maxFontSize: maxFontSize),
                      ),
                      duration: Duration(milliseconds: 300),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.only(
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
                                'Workouts',
                                textScaleFactor: .8,
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 22),
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
