import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExerciseListTile extends StatelessWidget {
  const ExerciseListTile({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  final Exercise exercise;
  @override
  Widget build(BuildContext context) {
    return (
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text(exercise.name ?? ""),
        subtitle: Wrap(
          spacing: 3,
          children: exercise.muscle_target != [] && exercise.muscle_target != null
              ? exercise.muscle_target!.map((e) {
                  return Chip(label: Text(e.name), backgroundColor: Theme.of(context).colorScheme.surface);
                }).toList()
              : [],
        ),
        trailing: Icon(FontAwesomeIcons.plus, color: Theme.of(context).colorScheme.secondary, size: 20),
      ),
    );
  }
}
