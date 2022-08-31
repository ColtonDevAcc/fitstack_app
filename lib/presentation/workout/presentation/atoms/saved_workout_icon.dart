import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SavedWorkoutIcon extends StatelessWidget {
  final void Function()? onTap;
  const SavedWorkoutIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Icon(
          FontAwesomeIcons.solidHeart,
          size: 17,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
