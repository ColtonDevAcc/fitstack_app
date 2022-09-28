import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Profile_Avatar_Widget(),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.chartSimple,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(width: 10),
                Text("25"),
              ],
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.shekelSign,
                  color: Theme.of(context).colorScheme.error,
                ),
                SizedBox(width: 10),
                Text("200"),
              ],
            ),
            SizedBox(),
          ],
        ),
        SizedBox(height: 50),
        Container(
          child: Column(
            children: [
              LinearProgressIndicator(
                value: .2,
                backgroundColor: Theme.of(context).colorScheme.onBackground.withOpacity(.08),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'xp',
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '20/100',
                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
