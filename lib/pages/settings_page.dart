import 'package:FitStack/features/profile/cubit/profile_cubit.dart';
import 'package:FitStack/features/profile/presentation/atoms/profile_drawer_listtile.dart';
import 'package:FitStack/features/profile/presentation/molecules/profile_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    child: ProfileSnapshot(
                      avatar: state.userProfile.avatar,
                      daysInARow: state.userProfile.days_logged_in_a_row,
                      fit_credits: state.userProfile.fit_credits,
                      socialPoints: state.userProfile.social_points,
                    ),
                  ),
                  SizedBox(height: 5),
                  ProfileDrawerListTile(
                    onTap: () => GoRouter.of(context).push('/friendship'),
                    title: "Friends",
                    icon: FontAwesomeIcons.userGroup,
                  ),
                  SizedBox(height: 5),
                  ProfileDrawerListTile(
                    title: "settings",
                    icon: FontAwesomeIcons.gear,
                  ),
                  SizedBox(height: 5),
                  ProfileDrawerListTile(
                    title: "alerts",
                    icon: FontAwesomeIcons.bell,
                  ),
                  SizedBox(height: 5),
                  ProfileDrawerListTile(
                    onTap: () => context.go("/settings/theme"),
                    title: "themes",
                    icon: FontAwesomeIcons.moon,
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
