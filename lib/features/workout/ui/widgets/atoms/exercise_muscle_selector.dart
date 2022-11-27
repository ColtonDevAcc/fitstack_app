import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/providers/bloc/exercise/exercise_bloc.dart';
import 'package:FitStack/app/services/muscle_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable/touchable.dart';

class ExerciseMuscleSelector extends StatelessWidget {
  final List<Muscle> majorMuscles;
  final List<Muscle> minorMuscles;
  final List<Muscle> muscleList;
  final Color majorMuscleColor;
  final void Function(LongPressEndDetails, Muscle) onMinorMuscleSelected;
  final void Function(TapUpDetails, Muscle) onMajorMuscleSelected;
  final Color minorMuscleColor;

  const ExerciseMuscleSelector({
    Key? key,
    required this.majorMuscles,
    required this.minorMuscles,
    required this.muscleList,
    required this.onMinorMuscleSelected,
    required this.majorMuscleColor,
    required this.minorMuscleColor,
    required this.onMajorMuscleSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Muscle Targets",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
              ),
        ),
        SizedBox(
          height: 20,
          child: Wrap(
            spacing: 5,
            runAlignment: WrapAlignment.start,
            children: minorMuscles
                .map(
                  (e) => Chip(
                    backgroundColor: minorMuscleColor,
                    label: Text(
                      e.name,
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                )
                .followedBy(
                  majorMuscles.map(
                    (e) => Chip(
                      backgroundColor: majorMuscleColor,
                      label: Text(
                        e.name,
                        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .5,
          child: CanvasTouchDetector(
            gesturesToOverride: [GestureType.onTapUp, GestureType.onLongPressEnd],
            builder: (context) => CustomPaint(
              painter: MusclePainter(
                context: context,
                muscleList: muscleList,
                majorMuscleList: majorMuscles,
                minorMuscleList: minorMuscles,
                onTapUp: onMajorMuscleSelected,
                onLongPressEnd: onMinorMuscleSelected,
                majorMuscleColor: majorMuscleColor,
                minorMuscleColor: minorMuscleColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
