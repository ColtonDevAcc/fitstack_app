import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function()? onTap;

  const SocialAuthButton({
    Key? key,
    required this.color,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        child: child,
      ),
    );
  }
}
