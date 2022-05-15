import 'package:flutter/material.dart';

class SocailAuthButton_Widget extends StatelessWidget {
  final Color color;
  final Widget child;
  const SocailAuthButton_Widget({Key? key, required this.color, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: child,
    );
  }
}
