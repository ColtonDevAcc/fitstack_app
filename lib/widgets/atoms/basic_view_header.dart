import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BasicPageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Color? color;
  final Widget? leading;
  final bool? centerTitle;
  final EdgeInsets? padding;
  final MainAxisAlignment? mainAxisAlignment;
  const BasicPageHeader({
    Key? key,
    required this.title,
    this.trailing,
    this.color,
    this.leading,
    this.centerTitle,
    this.subtitle,
    this.padding,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          children: [
            if (leading != null) leading!,
            AutoSizeText.rich(
              TextSpan(
                text: title,
                style: Theme.of(context).textTheme.titleLarge,
                children: [
                  if (subtitle != null) TextSpan(text: "\n$subtitle", style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              minFontSize: 25,
              maxLines: 2,
              textAlign: centerTitle ?? false ? TextAlign.center : TextAlign.right,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
