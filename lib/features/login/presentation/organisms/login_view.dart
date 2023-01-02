import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/features/login/cubit/login_cubit.dart';
import 'package:FitStack/widgets/atoms/fitstack_logo.dart';
import 'package:FitStack/widgets/atoms/focused_button.dart';
import 'package:FitStack/widgets/atoms/social_auth_button.dart';
import 'package:FitStack/widgets/atoms/textfield_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FitStackLogo(),
          const SizedBox(height: 15),
          AutoSizeText('LETS SIGN YOU IN,', maxFontSize: 90, minFontSize: 40, style: Theme.of(context).textTheme.titleLarge!.copyWith()),
          const SizedBox(height: 15),
          AutoSizeText("Welcome Back you've\nbeen missed!", style: Theme.of(context).textTheme.headlineMedium),
          const Spacer(flex: 2),
          Form(
            key: const Key("login_form"),
            child: Column(
              children: [
                FSTextField(
                  onChanged: (email) => context.read<LoginCubit>().emailChanged(email ?? ""),
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value) ? 'Enter a valid email' : null;
                  },
                  title: "Email",
                  hintText: 'Username or Email',
                ),
                const SizedBox(height: 15),
                FSTextField(
                  onChanged: (password) => context.read<LoginCubit>().passwordChanged(password ?? ""),
                  validator: (value) {
                    return value != null && value.length < 6 ? "Enter min. 6 characters" : null;
                  },
                  title: "Password",
                  bottomTitle: "Forgot Password?",
                  hintText: 'Password',
                  obscureText: true,
                ),
              ],
            ),
          ),
          const Spacer(flex: 10),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                text: "Don't have an account? ",
                children: [
                  TextSpan(
                    text: "      Sign Up!",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap = () => GoRouter.of(context).push('/signup'),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<AppBloc, AppState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return FocusedButton(
                title: "SIGN IN",
                onPressed: () => context.read<LoginCubit>().logInWithCredentials(),
                isLoading: state.status == AuthenticationStatus.authenticating,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialAuthButton(
                color: Theme.of(context).colorScheme.primary,
                child: Icon(FontAwesome.facebook_f, color: Theme.of(context).colorScheme.onPrimary),
              ),
              SocialAuthButton(
                color: Theme.of(context).colorScheme.secondary,
                child: Icon(FontAwesome.google, color: Theme.of(context).colorScheme.onSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
