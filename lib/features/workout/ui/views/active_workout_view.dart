import 'package:FitStack/features/exercise/presentation/molecules/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Workout'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Timeline.tileBuilder(
                    theme: TimelineThemeData(color: Theme.of(context).colorScheme.secondary),
                    builder: TimelineTileBuilder.fromStyle(
                      nodePositionBuilder: (context, index) => 0,
                      contentsBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: ExerciseCard(),
                      ),
                      itemCount: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
