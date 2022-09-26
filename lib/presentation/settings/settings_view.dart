import 'dart:developer';
import 'package:FitStack/app/bloc/app_bloc.dart';
import 'package:FitStack/widgets/atoms/profile_circular_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  getToken() async {
    log("refresh token ${context.read<AppBloc>().state.user!.refresh_token}");
  }

  @override
  Widget build(BuildContext context) {
    getToken();
    return SafeArea(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                actions: [
                  GestureDetector(
                    onTap: () => context.read<AppBloc>().add(AuthenticationLogoutRequested()),
                    child: Icon(FontAwesomeIcons.doorOpen),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Profile_Circular_Avatar(maxRadius: 60),
              ),
              Text('${state.user?.display_name}'),
            ],
          );
        },
      ),
    );
  }
}
