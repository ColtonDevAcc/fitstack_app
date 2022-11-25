import 'package:FitStack/app/providers/bloc/workout/workout_bloc.dart';
import 'package:FitStack/features/workout/ui/widgets/atoms/workout_statistic_snapshot_box.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CreateWorkoutView extends StatelessWidget {
  const CreateWorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          return CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SafeArea(
                        child: BasicPageHeader(
                          title: "${state.WorkoutName}",
                          leading: GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Container(
                              child: Icon(
                                FontAwesomeIcons.arrowLeftLong,
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${state.WorkoutName}',
                            style: Theme.of(context).textTheme.titleLarge,
                            textScaleFactor: 1.5,
                          ),
                          SizedBox(width: 10),
                          Icon(FontAwesomeIcons.pencil, size: 20, color: Theme.of(context).colorScheme.onBackground.withOpacity(.6)),
                        ],
                      ),
                      Text(
                        '${state.workouts.length} exercises',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            WorkoutStatisticBox(
                              label: 'Completions',
                              value: '30',
                              icon: FontAwesomeIcons.check,
                            ),
                            WorkoutStatisticBox(
                              label: 'Volume Lifted',
                              value: '30k lbs',
                              icon: Icons.monitor_weight,
                            ),
                            WorkoutStatisticBox(
                              label: 'Avg rest time',
                              value: '1:30 min',
                              icon: Icons.person_sharp,
                            ),
                            WorkoutStatisticBox(
                              label: 'Avg workout',
                              value: '60 min',
                              icon: FontAwesomeIcons.stopwatch,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Exercises", style: Theme.of(context).textTheme.titleLarge),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              context.push('/exercise/exercises');
                            },
                            child: Text(
                              "Add New",
                              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 10),
                          itemCount: state.workouts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.secondary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}', //TODO: Replace with exercise muscle image
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                color: Theme.of(context).colorScheme.onSecondary,
                                              ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      '${state.workouts[index].title}',
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    subtitle: Text(
                                      '3 sets of 10 reps',
                                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                                          ),
                                    ),
                                    trailing: Icon(
                                      FontAwesomeIcons.ellipsisVertical,
                                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
