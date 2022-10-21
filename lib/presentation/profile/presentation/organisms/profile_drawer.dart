import 'dart:developer';

import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/presentation/profile/presentation/atoms/profile_drawer_listtile.dart';
import 'package:clipboard/clipboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              onTap: () => GoRouter.of(context).push('/friendship'),
              title: "Friends",
              icon: FontAwesomeIcons.userGroup,
            ),
            ProfileDrawerListTile(
              title: "Extra",
              icon: FontAwesomeIcons.gear,
            ),
            ProfileDrawerListTile(
              onTap: () => context.read<AppBloc>().add(AuthenticationLogoutRequested()),
              title: "Sign Out",
              icon: FontAwesomeIcons.rightFromBracket,
            ),
            Spacer(
              flex: 1,
            ),
            ProfileDrawerListTile(
              onTap: () async {
                final user = BlocProvider.of<AppBloc>(context).state.user!;
                Scaffold.of(context).showBottomSheet(
                    (context) => Container(
                          height: 200,
                          child: Text("${user.toJson()}"),
                        ),
                    backgroundColor: Theme.of(context).colorScheme.surface);
                var userId = await FirebaseAuth.instance.currentUser?.getIdToken();
                FlutterClipboard.copy(userId ?? "");
                log("========================\nuser refresh token ${user.refresh_token}\n========================");
                log("========================\nuser refresh token ${user.user_id}\n========================");
                log("========================\nuser token ${userId}\n========================");
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
