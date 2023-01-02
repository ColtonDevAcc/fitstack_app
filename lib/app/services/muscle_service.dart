import 'dart:developer';
import 'package:FitStack/app/models/muscle/recovery_model.dart';
import 'package:flutter/services.dart';
import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:flutter/material.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:touchable/touchable.dart';
import 'package:xml/xml.dart';

class MuscleService {
  Future<List<Muscle>> svgToMuscles(String url) async {
    try {
      final generalString = await rootBundle.loadString(url);
      final XmlDocument document = XmlDocument.parse(generalString);
      MuscleGroup? group;
      final List<Muscle> muscles = [];
      final paths = document.findAllElements('path');
      for (final element in paths) {
        final String partName = element.getAttribute('id').toString();
        final String partPath = element.getAttribute('d').toString();
        final Path svgPath = parseSvgPath(partPath);

        if (!partName.contains('path')) {
          final List<String> parsedName = partName.split("_");
          for (final element in muscleMap.entries) {
            final String parsedNameCheck = parsedName.length > 1 ? '${parsedName[0]} ${parsedName[1]}'.toLowerCase() : parsedName[0].toLowerCase();

            if (element.value.firstWhere((element) => element.toLowerCase() == parsedNameCheck, orElse: () => 'empty') != 'empty') {
              group = element.key;
            }
          }

          final Muscle part = Muscle(
            name: parsedName.length >= 2 ? '${parsedName[0]} ${parsedName[1]}' : parsedName[0],
            svgPath: svgPath,
            group: group ?? MuscleGroup.Empty,
          );
          muscles.add(part);
        }
      }
      return muscles;
    } catch (e) {
      log("Error parsing front muscles: $e");
      return [];
    }
  }
}

class SelectionMusclePainter extends CustomPainter {
  final BuildContext context;
  final List<Muscle> muscleList;
  final List<Muscle>? majorMuscleList;
  final List<Muscle>? minorMuscleList;
  final Color majorMuscleColor;
  final Color minorMuscleColor;
  final int muscleAnatomyViewRotationIndex;

  final void Function(TapUpDetails, Muscle) onTapUp;
  final void Function(LongPressEndDetails, Muscle) onLongPressEnd;

  SelectionMusclePainter({
    required this.muscleAnatomyViewRotationIndex,
    required this.majorMuscleColor,
    required this.minorMuscleColor,
    required this.onLongPressEnd,
    required this.minorMuscleList,
    required this.onTapUp,
    required this.context,
    required this.muscleList,
    required this.majorMuscleList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final baseCanvas = TouchyCanvas(context, canvas);
    double xScale;
    double yScale;

    if (muscleAnatomyViewRotationIndex == 0) {
      xScale = size.width / 1107.22900;
      yScale = size.height / 3488.78076;
    } else {
      xScale = size.width / 1154.618;
      yScale = size.height / 3491.132;
    }

    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(xScale, yScale);

    for (final Muscle muscle in muscleList) {
      Color getMuscleColor(Muscle muscle) {
        if (majorMuscleList != null && majorMuscleList!.map((e) => e.group == muscle.group).contains(true)) {
          return majorMuscleColor;
        } else if (minorMuscleList != null && minorMuscleList!.map((e) => e.group == muscle.group).contains(true)) {
          return minorMuscleColor;
        } else if (muscle.name == 'outline' || muscle.name == 'inner_outline') {
          return Theme.of(context).colorScheme.onBackground.withOpacity(.1);
        }
        return Theme.of(context).colorScheme.surface;
      }

      baseCanvas.drawPath(
        muscle.svgPath!.transform(matrix4.storage),
        Paint()
          ..color = getMuscleColor(muscle)
          ..strokeWidth = 2.0,
        onTapUp: (details) => onTapUp(details, muscle),
        onLongPressEnd: (details) => onLongPressEnd(details, muscle),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MusclePainter extends CustomPainter {
  final BuildContext context;
  final List<Muscle> muscleList;
  final int muscleAnatomyViewRotationIndex;
  final Recovery recovery;
  final List<Color> muscleColorList;
  final void Function(TapUpDetails, Muscle) onTapUp;
  final void Function(LongPressEndDetails, Muscle) onLongPressEnd;

  MusclePainter({
    required this.recovery,
    required this.muscleAnatomyViewRotationIndex,
    required this.onLongPressEnd,
    required this.onTapUp,
    required this.context,
    required this.muscleList,
    required this.muscleColorList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final baseCanvas = TouchyCanvas(context, canvas);
    double xScale;
    double yScale;

    if (muscleAnatomyViewRotationIndex == 0) {
      xScale = size.width / 1107.22900;
      yScale = size.height / 3488.78076;
    } else {
      xScale = size.width / 1154.618;
      yScale = size.height / 3491.132;
    }

    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(xScale, yScale);

    for (final Muscle muscle in muscleList) {
      final now = DateTime.now();
      Color muscleColor = Theme.of(context).colorScheme.tertiary;

      Color getMuscleColor(Muscle muscle) {
        final recoveryMuscle = recovery.muscles.firstWhere((element) => element.group == muscle.group, orElse: Muscle.empty);
        if (recoveryMuscle != Muscle.empty()) {
          final recoveryValue = now.difference(recoveryMuscle.updatedAt!).inHours < 72 ? (now.difference(recoveryMuscle.updatedAt!).inHours / 72) : 1;
          // ignore: join_return_with_assignment
          muscleColor = muscleColorList[recoveryValue < .5
              ? 0
              : recoveryValue < .75
                  ? 1
                  : 2];

          return muscleColor;
        } else if (muscle.name == 'outline' || muscle.name == 'inner outline') {
          return Theme.of(context).colorScheme.onBackground.withOpacity(.1);
        }
        return Colors.green;
      }

      baseCanvas.drawPath(
        muscle.svgPath!.transform(matrix4.storage),
        Paint()
          ..color = getMuscleColor(muscle)
          ..strokeWidth = 2.0,
        onTapUp: (details) => onTapUp(details, muscle),
        onLongPressEnd: (details) => onLongPressEnd(details, muscle),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
