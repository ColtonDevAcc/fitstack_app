import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SavedWorkoutIcon extends StatelessWidget {
  final void Function()? onTap;
  const SavedWorkoutIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Icon(
          FontAwesome.heart,
          size: 10,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
