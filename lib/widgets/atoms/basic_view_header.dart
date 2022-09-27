import 'package:flutter/material.dart';

class BasicViewHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Color? color;
  const BasicViewHeader({Key? key, required this.title, this.trailing, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          //TODO: need to use auto resize package
          textScaleFactor: 1.3,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: color ?? Theme.of(context).colorScheme.primary),
        ),
        trailing ?? SizedBox(),
      ],
    );
  }
}
