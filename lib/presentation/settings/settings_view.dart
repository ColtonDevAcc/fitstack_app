import 'package:FitStack/presentation/profile/cubit/profile_cubit.dart';
import 'package:FitStack/presentation/profile/presentation/molecules/profile_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ProfileSnapshot(
          avatar: state.userProfile.avatar,
          daysInARow: state.userProfile.days_logged_in_a_row,
          fit_credits: state.userProfile.fit_credits,
          socialPoints: state.userProfile.social_points,
        );
      },
    );
  }
}
