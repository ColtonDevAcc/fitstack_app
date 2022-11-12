import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BasicViewHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Color? color;
  final Widget? leading;
  const BasicViewHeader({Key? key, required this.title, this.trailing, this.color, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                title,
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: color ?? Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: trailing ?? SizedBox(),
            )
          ],
        ),
      ],
    );
  }
}
