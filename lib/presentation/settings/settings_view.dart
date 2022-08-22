import 'dart:developer';

import 'package:FitStack/app/bloc/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/widgets/atoms/profile_circular_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings_View extends StatefulWidget {
  const Settings_View({Key? key}) : super(key: key);

  @override
  State<Settings_View> createState() => _Settings_ViewState();
}

class _Settings_ViewState extends State<Settings_View> {
  getToken() async {
    var token = await FirebaseAuth.instance.currentUser?.getIdToken();
    log("$token");
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
