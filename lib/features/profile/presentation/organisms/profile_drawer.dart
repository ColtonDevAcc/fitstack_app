import 'dart:developer';

import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/features/profile/presentation/atoms/profile_drawer_listtile.dart';
import 'package:clipboard/clipboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:go_router/go_router.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const ProfileDrawerListTile(
              title: "Alerts",
              icon: FontAwesome.bell,
            ),
            ProfileDrawerListTile(
              onTap: () => GoRouter.of(context).push('/friendship'),
              title: "Friends",
              icon: FontAwesome.user_group,
            ),
            const ProfileDrawerListTile(
              title: "Extra",
              icon: FontAwesome.gear,
            ),
            ProfileDrawerListTile(
              onTap: () => context.read<AppBloc>().add(AuthenticationLogoutRequested()),
              title: "Sign Out",
              icon: FontAwesome.right_from_bracket,
            ),
            const Spacer(
              
            ),
            ProfileDrawerListTile(
              onTap: () async {
                final user = BlocProvider.of<AppBloc>(context).state.user!;
                Scaffold.of(context).showBottomSheet(
                    (context) => SizedBox(
                          height: 200,
                          child: Text("${user.toJson()}"),
                        ),
                    backgroundColor: Theme.of(context).colorScheme.surface,);
                final userId = await FirebaseAuth.instance.currentUser?.getIdToken();
                FlutterClipboard.copy(userId ?? "");
                log("========================\nuser refresh token ${user.refreshToken}\n========================");
                log("========================\nuser refresh token ${user.id}\n========================");
                log("========================\nuser token $userId\n========================");
              },
              title: "Developer",
              icon: FontAwesome.terminal,
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text("version: 1"),
            )
          ],
        ),
      ),
    );
  }
}
