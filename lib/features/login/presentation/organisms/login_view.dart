import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/features/login/cubit/login_cubit.dart';
import 'package:FitStack/features/login/presentation/atoms/Login_Account_SignUp_Text_Widget.dart';
import 'package:FitStack/features/login/presentation/atoms/Login_Email_Field_Widget.dart';
import 'package:FitStack/features/login/presentation/atoms/Login_Password_Field_Widget.dart';
import 'package:FitStack/widgets/atoms/FitStack_Logo_Widget.dart';
import 'package:FitStack/widgets/atoms/focusedButton_widget.dart';
import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class Login_View extends StatelessWidget {
  const Login_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FitStack_Logo_Widget(),
          const SizedBox(height: 15),
          AutoSizeText(
            'LETS SIGN YOU IN,',
            maxFontSize: 90,
            minFontSize: 40,
            maxLines: 1,
            //style: TextStyle(color: Theme.of(context).primaryColor),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 15),
          Text(
            "Welcome Back you've\nbeen missed!",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
                ),
          ),
          const Spacer(flex: 2),
          Form(
            key: const Key("login_form"),
            child: Column(
              children: const [
                Login_Email_Field_Widget(),
                SizedBox(height: 15),
                Login_Password_Field_Widget(),
              ],
            ),
          ),
          const Spacer(flex: 10),
          const Login_Account_SignUp_Text_Widget(),
          const SizedBox(height: 10),
          BlocBuilder<AppBloc, AppState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return FocusedButton_Widget(
                title: state.status == AuthenticationStatus.authenticating
                    ? SizedBox(height: 15, width: 15, child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary))
                    : Text(
                        "SIGN IN",
                        style:
                            Theme.of(context).textTheme.button?.copyWith(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),
                      ),
                onPressed: () => context.read<LoginCubit>().logInWithCredentials(),
              );
            },
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialAuthButton_Widget(
                color: Theme.of(context).colorScheme.primary,
                child: Icon(FontAwesome.facebook_f, color: Theme.of(context).colorScheme.onPrimary),
              ),
              const SizedBox(width: 15),
              SocialAuthButton_Widget(
                onTap: () {},
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
