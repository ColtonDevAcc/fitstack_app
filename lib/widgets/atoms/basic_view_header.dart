import 'package:auto_size_text/auto_size_text.dart';
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
        AutoSizeText(
          title,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: color ?? Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        trailing ?? SizedBox(),
      ],
    );
  }
}
