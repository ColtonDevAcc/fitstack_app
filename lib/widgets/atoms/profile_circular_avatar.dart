import 'package:flutter/material.dart';

class Profile_Circular_Avatar extends StatelessWidget {
  final double? maxRadius;
  const Profile_Circular_Avatar({Key? key, this.maxRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: maxRadius ?? 60,
    );
  }
}
