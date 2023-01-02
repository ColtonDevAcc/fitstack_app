import 'package:FitStack/features/exercise/presentation/molecules/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class WorkoutTabView extends StatelessWidget {
  const WorkoutTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      padding: EdgeInsets.zero,
      theme: TimelineThemeData(color: Theme.of(context).colorScheme.secondary),
      builder: TimelineTileBuilder.fromStyle(
        nodePositionBuilder: (context, index) => 0,
        contentsBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(24.0),
          child: ExerciseCard(),
        ),
        itemCount: 20,
      ),
    );
  }
}
