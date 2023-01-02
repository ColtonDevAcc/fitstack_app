import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  final BuildContext context;
  final List<Path> pathList;

  PathPainter({
    required this.context,
    required this.pathList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double xScale;
    double yScale;

    xScale = size.width / 1107.22900;
    yScale = size.height / 3488.78076;

    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(xScale, yScale);

    for (final path in pathList) {
      canvas.drawPath(
        path.transform(matrix4.storage),
        Paint()
          ..color = Theme.of(context).colorScheme.primary
          ..strokeWidth = 2.0,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
