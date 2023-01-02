import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function()? onTap;
  final EdgeInsets? padding;

  const SocialAuthButton({
    Key? key,
    required this.color,
    required this.child,
    this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: CircleAvatar(
          backgroundColor: color,
          child: child,
        ),
      ),
    );
  }
}
