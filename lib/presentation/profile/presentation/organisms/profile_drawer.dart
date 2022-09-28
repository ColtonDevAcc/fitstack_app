import 'package:FitStack/app/injection/dependency_injection.dart';
import 'package:FitStack/app/providers/bloc/app_bloc.dart';
import 'package:FitStack/presentation/profile/presentation/atoms/profile_drawer_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ProfileDrawerListTile(
              title: "Alerts",
              icon: FontAwesomeIcons.bell,
            ),
            ProfileDrawerListTile(
              title: "Friends",
              icon: FontAwesomeIcons.userGroup,
            ),
            ProfileDrawerListTile(
              title: "Extra",
              icon: FontAwesomeIcons.gear,
            ),
            ProfileDrawerListTile(
              onTap: () => getIt<AppBloc>().add(AuthenticationLogoutRequested()),
              title: "Sign Out",
              icon: FontAwesomeIcons.rightFromBracket,
            ),
            Spacer(
              flex: 1,
            ),
            ProfileDrawerListTile(
              onTap: () {
                Scaffold.of(context).showBottomSheet(
                    (context) => Container(
                          height: 200,
                          child: Text("${BlocProvider.of<AppBloc>(context).state.user!.toJson()}"),
                        ),
                    backgroundColor: Theme.of(context).colorScheme.surface);
              },
              title: "Developer",
              icon: FontAwesomeIcons.terminal,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("version: 1"),
            )
          ],
        ),
      ),
    );
  }
}
