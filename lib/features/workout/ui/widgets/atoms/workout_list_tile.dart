import 'package:FitStack/app/models/workout/workout_model.dart';
import 'package:FitStack/app/providers/bloc/workout/workout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutListTile extends StatelessWidget {
  final Workout workout;
  const WorkoutListTile({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Slidable(
        direction: Axis.horizontal,
        child: Container(
          // box decoration where the bottom is grey
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              workout.title ?? "Workout",
              textScaleFactor: .9,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              workout.description ?? "no description",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ),
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => context.read<WorkoutBloc>().add(DeleteWorkout(id: workout.id!)),
                child: Container(
                  color: Theme.of(context).colorScheme.error,
                  height: 100,
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                height: 100,
                child: Icon(
                  Icons.share,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
