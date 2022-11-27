import 'dart:developer';
import 'package:flutter/services.dart';

import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:flutter/material.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:touchable/touchable.dart';
import 'package:xml/xml.dart';

class MuscleService {
  Future<List<Muscle>> ParseFrontMuscleList() async {
    String generalString = await rootBundle.loadString("assets/muscles/model/muscle_front_inkscape_1.svg", cache: false);
    XmlDocument document = XmlDocument.parse(generalString);
    final paths = document.findAllElements('path');
    List<Muscle> muscles = [];
    int muscleChecks = 0;

    paths.forEach(
      (element) async {
        String partName = element.getAttribute('id').toString();
        String partPath = element.getAttribute('d').toString();
        Path svgPath = parseSvgPath(partPath);

        if (!partName.contains('path')) {
          Muscle part = Muscle(
            name: partName,
            svgPath: svgPath,
            type: PrimaryMuscleGroups.values.firstWhere(
              (element) {
                muscleChecks++;
                return partName.toLowerCase().contains(element.toString().split(".")[1].toLowerCase());
              },
              orElse: () => PrimaryMuscleGroups.empty,
            ),
          );
          muscles.add(part);
        }
      },
    );
    log("Muscle checks: $muscleChecks");
    return muscles;
  }

  Future<List<Muscle>> ParseBackMuscleList() async {
    String generalString = await rootBundle.loadString("assets/muscles/model/muscle_front.svg", cache: true);
    XmlDocument document = XmlDocument.parse(generalString);
    final paths = document.findAllElements('path');
    List<Muscle> muscles = [];
    int muscleChecks = 0;

    paths.forEach(
      (element) async {
        String partName = element.getAttribute('id').toString();
        String partPath = element.getAttribute('d').toString();
        Path svgPath = parseSvgPath(partPath);

        if (!partName.contains('path')) {
          Muscle part = Muscle(
            name: partName,
            svgPath: svgPath,
            type: PrimaryMuscleGroups.values.firstWhere(
              (element) {
                muscleChecks++;
                return partName.toLowerCase().contains(element.toString().split(".")[1].toLowerCase());
              },
              orElse: () => PrimaryMuscleGroups.empty,
            ),
          );
          muscles.add(part);
        }
      },
    );
    log("Muscle checks: $muscleChecks");
    return muscles;
  }
}

class MusclePainter extends CustomPainter {
  final BuildContext context;
  final List<Muscle> muscleList;
  final List<Muscle>? majorMuscleList;
  final List<Muscle>? minorMuscleList;
  final Color majorMuscleColor;
  final Color minorMuscleColor;

  final void Function(TapUpDetails, Muscle) onTapUp;
  final void Function(LongPressEndDetails, Muscle) onLongPressEnd;

  MusclePainter({
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
    var _canvas = TouchyCanvas(context, canvas);

    // var xScale = size.width * 2.39 / 2.9 / 1700;
    // var yScale = size.height * 10 / 5.5 / 6400;
    var xScale = size.width / 115;
    var yScale = size.height / 297;
    // var xScale = size.width;
    // var yScale = size.height;

    final Matrix4 matrix4 = Matrix4.identity();
    // matrix4.scale(xScale, yScale);

    for (Muscle muscle in muscleList) {
      Color getMuscleColor(Muscle muscle) {
        if (majorMuscleList != null && majorMuscleList!.map((e) => e.type == muscle.type).contains(true)) {
          return majorMuscleColor;
        } else if (minorMuscleList != null && minorMuscleList!.map((e) => e.type == muscle.type).contains(true)) {
          return minorMuscleColor;
        } else if (muscle.type == PrimaryMuscleGroups.outline || muscle.type == PrimaryMuscleGroups.inner_outline) {
          return Theme.of(context).colorScheme.onBackground.withOpacity(.2);
        }
        return Theme.of(context).colorScheme.surface;
      }

      _canvas.drawPath(
        muscle.svgPath!.transform(matrix4.storage),
        Paint()
          ..color = getMuscleColor(muscle)
          ..strokeWidth = 4.0,
        onTapUp: (details) => onTapUp(details, muscle),
        onLongPressEnd: (details) => onLongPressEnd(details, muscle),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
