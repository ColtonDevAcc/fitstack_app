import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularStatisticsProgressIndicator extends StatelessWidget {
  final double ratio;
  final Color outerColor;
  final Color innerColor;
  final String? label;

  const CircularStatisticsProgressIndicator({
    Key? key,
    required this.ratio,
    required this.outerColor,
    required this.innerColor,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: <Widget>[
            Align(
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
          ],
        ),
        if (label != null)
          AutoSizeText(
            label!,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
