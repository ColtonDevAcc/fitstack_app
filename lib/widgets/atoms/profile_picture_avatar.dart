import 'package:flutter/material.dart';

class ProfilePictureAvatar extends StatelessWidget {
  final double? maxRadius;
  final bool? withBorder;
  const ProfilePictureAvatar({Key? key, this.maxRadius, this.withBorder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(80),
        border: withBorder == false ? null : Border.all(color: Theme.of(context).colorScheme.primary, width: 1.5),
      ),
      padding: EdgeInsets.all(5),
      child: CircleAvatar(
        maxRadius: maxRadius ?? 60,
      ),
    );
  }
}
