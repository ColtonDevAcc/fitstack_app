import 'package:FitStack/widgets/atoms/profile_circular_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings_View extends StatelessWidget {
  const Settings_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(
            actions: [
              GestureDetector(
                // onTap: () => context.read<AppBloc>().add(SignOut()),
                child: Icon(FontAwesomeIcons.doorOpen),
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: Profile_Circular_Avatar(maxRadius: 60),
          ),
          // Text('${user?.displayName}')
        ],
      ),
    );
  }
}
