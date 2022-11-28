import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/features/login/cubit/login_cubit.dart';
import 'package:FitStack/features/login/presentation/atoms/Login_Account_SignUp_Text_Widget.dart';
import 'package:FitStack/widgets/atoms/focusedButton_widget.dart';
import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_Footer_Widget extends StatelessWidget {
  const Login_Footer_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Login_Account_SignUp_Text_Widget(),
        SizedBox(height: 10),
        BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return FocusedButton_Widget(
              title: state.status == AuthenticationStatus.authenticating
                  ? SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  : Text(
                      "SIGN IN",
                      style:
                          Theme.of(context).textTheme.button?.copyWith(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),
                    ),
              onPressed: () {
                context.read<LoginCubit>().logInWithCredentials();
              },
            );
          },
        ),
        SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialAuthButton_Widget(
              color: Theme.of(context).colorScheme.primary,
              child: FaIcon(
                FontAwesomeIcons.facebookF,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(width: 15),
            SocialAuthButton_Widget(
              onTap: () {},
              color: Theme.of(context).colorScheme.secondary,
              child: FaIcon(
                FontAwesomeIcons.google,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
