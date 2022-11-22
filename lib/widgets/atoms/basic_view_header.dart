import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicPageHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Color? color;
  final Widget? leading;
  const BasicPageHeader({Key? key, required this.title, this.trailing, this.color, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: leading ?? SizedBox(),
              ),
              Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  title,
                  minFontSize: 20,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: color ?? Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.bebasNeue().fontFamily,
                        letterSpacing: .8,
                      ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: trailing ?? SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
