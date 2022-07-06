import 'package:fitstackapp/core/bloc/auth/auth_bloc.dart';
import 'package:fitstackapp/widgets/atoms/profile_circular_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings_View extends StatelessWidget {
  const Settings_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).authRepository.signOut();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Profile_Circular_Avatar(maxRadius: 60),
          ),
        ],
      ),
    );
  }
}
