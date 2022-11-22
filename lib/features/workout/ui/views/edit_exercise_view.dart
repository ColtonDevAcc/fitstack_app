import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:flutter/material.dart';

class EditExerciseView extends StatelessWidget {
  final Exercise exercise;

  const EditExerciseView({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                //create forms for editing the exercise
              ],
            ),
          )
        ],
      ),
    );
  }
}
