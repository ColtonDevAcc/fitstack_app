import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/presentation/login/presentation/molecules/Login_Footer_Widget.dart';
import 'package:FitStack/presentation/login/presentation/molecules/Login_Form_Widget.dart';
import 'package:FitStack/presentation/login/presentation/molecules/Login_Header_Widget.dart';
import 'package:FitStack/widgets/atoms/focusedButton_widget.dart';
import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_View extends StatelessWidget {
  Login_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
          child: Padding(
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
                SizedBox(height: 15),
                Login_Footer_Widget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
