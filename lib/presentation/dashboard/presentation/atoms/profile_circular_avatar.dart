import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileCircularAvatar extends StatelessWidget {
  const ProfileCircularAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? profileUrl = BlocProvider.of<AppBloc>(context).state.user?.photo_url;
    bool hasProfileImage = profileUrl != null && profileUrl != "";
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/user/profile');
      },
      child: CircleAvatar(
        maxRadius: 20,
        backgroundImage: hasProfileImage ? NetworkImage(profileUrl) : null,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: !hasProfileImage ? Center(child: Icon(FontAwesomeIcons.user, size: 17, color: Theme.of(context).colorScheme.background)) : null,
      ),
    );
  }
}
