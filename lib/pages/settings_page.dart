import 'package:FitStack/features/profile/cubit/profile_cubit.dart';
import 'package:FitStack/features/profile/presentation/atoms/profile_drawer_listtile.dart';
import 'package:FitStack/features/profile/presentation/molecules/profile_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Material(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: ProfileSnapshot(
                      avatar: state.userProfile.avatar,
                      daysInARow: state.userProfile.loginStreak,
                      fit_credits: state.userProfile.fitCredits,
                      socialPoints: state.userProfile.socialPoints,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ProfileDrawerListTile(
                    onTap: () => GoRouter.of(context).push('/friendship'),
                    title: "Friends",
                    icon: FontAwesome.user_group,
                  ),
                  const SizedBox(height: 5),
                  const ProfileDrawerListTile(
                    title: "settings",
                    icon: FontAwesome.gear,
                  ),
                  const SizedBox(height: 5),
                  const ProfileDrawerListTile(
                    title: "alerts",
                    icon: FontAwesome.bell,
                  ),
                  const SizedBox(height: 5),
                  ProfileDrawerListTile(
                    onTap: () => context.go("/settings/theme"),
                    title: "themes",
                    icon: FontAwesome.moon,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
