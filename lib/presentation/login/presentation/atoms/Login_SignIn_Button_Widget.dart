import 'dart:developer';

import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/widgets/atoms/focusedButton_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_SignIn_Button_Widget extends StatelessWidget {
  const Login_SignIn_Button_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return FocusedButton_Widget(
            text: "SIGN IN",
            onPressed: () {
              if (kDebugMode) log("trying to log you in ....");
              context.read<LoginCubit>().logInWithCredentials();
            },
          );
        },
      ),
    );
  }
}
