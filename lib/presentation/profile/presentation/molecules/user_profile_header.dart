import 'package:FitStack/app/bloc/app_bloc.dart';
import 'package:FitStack/app/models/user_model.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = BlocProvider.of<AppBloc>(context).state.user!;
    return Row(
      children: [
        Profile_Avatar_Widget(),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.display_name,
              style: Theme.of(context).textTheme.labelLarge,
              textScaleFactor: 1.4,
            ),
            Text("member since: ${fb.FirebaseAuth.instance.currentUser?.metadata.creationTime}"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.locationDot,
                  size: 15,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                SizedBox(width: 2),
                //TODO: add user location field
                Text("TODO: add user location"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
