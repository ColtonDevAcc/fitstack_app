import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FitStackLogo extends StatelessWidget {
  final EdgeInsets? padding;
  const FitStackLogo({Key? key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      width: screenSize.width * 0.5,
      height: screenSize.height * 0.07,
      padding: padding ?? const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: SvgPicture.asset(
        'assets/app/icons/AppLogo.svg',
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.5,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
