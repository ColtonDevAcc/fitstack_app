import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/models/muscle/recovery_model.dart';
import 'package:FitStack/app/services/muscle_service.dart';
import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class RecoverySvgPainter extends StatelessWidget {
  final Recovery recovery;
  final List<Muscle> frontMuscleList;
  final List<Muscle> backMuscleList;
  final Color majorMuscleColor;
  final void Function(LongPressEndDetails, Muscle) onMinorMuscleSelected;
  final void Function(TapUpDetails, Muscle) onMajorMuscleSelected;
  final Color minorMuscleColor;
  final int muscleAnatomyViewRotationIndex;
  final double? height;
  final double? width;
  final List<Color> muscleColorList;

  const RecoverySvgPainter({
    Key? key,
    required this.recovery,
    required this.frontMuscleList,
    required this.backMuscleList,
    required this.majorMuscleColor,
    required this.onMinorMuscleSelected,
    required this.onMajorMuscleSelected,
    required this.minorMuscleColor,
    required this.muscleAnatomyViewRotationIndex,
    this.height,
    this.width,
    required this.muscleColorList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width ?? MediaQuery.of(context).size.width * .5,
          height: height ?? MediaQuery.of(context).size.height * .5,
          child: CanvasTouchDetector(
            gesturesToOverride: const [GestureType.onTapUp, GestureType.onLongPressEnd],
            builder: (context) => CustomPaint(
              painter: MusclePainter(
                context: context,
                muscleList: muscleAnatomyViewRotationIndex == 0 ? frontMuscleList : backMuscleList,
                onTapUp: onMajorMuscleSelected,
                onLongPressEnd: onMinorMuscleSelected,
                muscleColorList: muscleColorList,
                muscleAnatomyViewRotationIndex: muscleAnatomyViewRotationIndex,
                recovery: recovery,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
