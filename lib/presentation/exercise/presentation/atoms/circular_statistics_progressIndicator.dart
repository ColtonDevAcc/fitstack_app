import 'package:flutter/material.dart';

class CircularStatisticsProgressIndicator extends StatelessWidget {
  final double ratio;
  final Color outerColor;
  final Color innerColor;
  final String label;

  const CircularStatisticsProgressIndicator({
    Key? key,
    required this.ratio,
    required this.outerColor,
    required this.innerColor,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: ratio,
            width: ratio,
            child: CircularProgressIndicator(
              backgroundColor: outerColor.withOpacity(0.2),
              strokeWidth: ratio / 10,
              value: 0.7,
              valueColor: AlwaysStoppedAnimation<Color>(outerColor),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(ratio * .145),
            child: SizedBox(
              height: ratio / 1.4,
              width: ratio / 1.4,
              child: CircularProgressIndicator(
                backgroundColor: innerColor.withOpacity(0.2),
                strokeWidth: ratio / 10,
                value: 0.7,
                valueColor: AlwaysStoppedAnimation<Color>(innerColor),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(label, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: innerColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
