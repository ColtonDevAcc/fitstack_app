import 'package:fitstackapp/widgets/atoms/profile_circular_avatar.dart';
import 'package:flutter/material.dart';

class Settings_View extends StatelessWidget {
  const Settings_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Profile_Circular_Avatar(maxRadius: 60),
          ),
        ],
      ),
    );
  }
}
