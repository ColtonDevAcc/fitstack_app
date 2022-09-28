import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/presentation/login/presentation/molecules/Login_Footer_Widget.dart';
import 'package:FitStack/presentation/login/presentation/molecules/Login_Form_Widget.dart';
import 'package:FitStack/presentation/login/presentation/molecules/Login_Header_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_View extends StatelessWidget {
  const Login_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.step == AuthStep.Error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Login_Header_Widget(),
              Spacer(flex: 2),
              Login_Form_Widget(
                key: Key("Login_Form"),
              ),
              Spacer(flex: 10),
              Login_Footer_Widget(),
            ],
          ),
        );
      },
    );
  }
}
