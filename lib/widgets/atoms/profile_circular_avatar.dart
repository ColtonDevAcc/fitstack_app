import 'package:flutter/material.dart';

class Profile_Circular_Avatar extends StatelessWidget {
  final double? maxRadius;
  const Profile_Circular_Avatar({Key? key, this.maxRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(80),
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1.5),
      ),
      padding: EdgeInsets.all(5),
      child: CircleAvatar(
        maxRadius: maxRadius ?? 60,
      ),
    );
  }
}
