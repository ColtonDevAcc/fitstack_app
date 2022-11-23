import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/providers/bloc/exercise/exercise_bloc.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ExerciseListTile extends StatelessWidget {
  const ExerciseListTile({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  final Exercise exercise;
  @override
  Widget build(BuildContext context) {
    User user = context.read<AppBloc>().state.user ?? User.empty();
    return Slidable(
      startActionPane: user.id == "8uySBz11AfV9gf1VYlGRznOoZWr1"
          ? ActionPane(
              motion: const ScrollMotion(),
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<ExerciseBloc>().add(EditExercise(exercise: exercise));
                      context.pushNamed("edit");
                    },
                    child: Container(
                      color: Theme.of(context).colorScheme.secondary,
                      height: 100,
                      child: Icon(
                        FontAwesomeIcons.pencil,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text(exercise.name ?? ""),
        leading: exercise.images == null || exercise.images!.isEmpty
            ? null
            : ExtendedImage.network(
                exercise.images?.first ?? "",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                printError: true,
                cache: true,
              ),
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
