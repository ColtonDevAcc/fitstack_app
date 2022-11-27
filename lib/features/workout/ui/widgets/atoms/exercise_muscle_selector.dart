import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/services/muscle_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:touchable/touchable.dart';

class ExerciseMuscleSelector extends StatelessWidget {
  final List<Muscle> majorMuscles;
  final List<Muscle> minorMuscles;
  final List<Muscle> frontMuscleList;
  final List<Muscle> backMuscleList;
  final Color majorMuscleColor;
  final void Function(LongPressEndDetails, Muscle) onMinorMuscleSelected;
  final void Function(TapUpDetails, Muscle) onMajorMuscleSelected;
  final void Function() onIconPressed;
  final Color minorMuscleColor;
  final int muscleAnatomyViewRotationIndex;

  const ExerciseMuscleSelector({
    Key? key,
    required this.majorMuscles,
    required this.minorMuscles,
    required this.frontMuscleList,
    required this.onMinorMuscleSelected,
    required this.majorMuscleColor,
    required this.minorMuscleColor,
    required this.onMajorMuscleSelected,
    required this.onIconPressed,
    required this.muscleAnatomyViewRotationIndex,
    required this.backMuscleList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Muscle Targets",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                  ),
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onIconPressed,
              splashRadius: 20,
              alignment: Alignment.center,
              constraints: BoxConstraints(),
              visualDensity: VisualDensity.compact,
              icon: Icon(FontAwesomeIcons.rotate),
            )
          ],
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
        AspectRatio(
          aspectRatio: 3 / 6,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: CanvasTouchDetector(
              gesturesToOverride: [GestureType.onTapUp, GestureType.onLongPressEnd],
              builder: (context) => CustomPaint(
                painter: MusclePainter(
                  context: context,
                  muscleList: muscleAnatomyViewRotationIndex == 0 ? frontMuscleList : backMuscleList,
                  majorMuscleList: majorMuscles,
                  minorMuscleList: minorMuscles,
                  onTapUp: onMajorMuscleSelected,
                  onLongPressEnd: onMinorMuscleSelected,
                  majorMuscleColor: majorMuscleColor,
                  minorMuscleColor: minorMuscleColor,
                  muscleAnatomyViewRotationIndex: muscleAnatomyViewRotationIndex,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
