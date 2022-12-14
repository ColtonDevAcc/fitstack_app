import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Login_SignIn_With_Google_Widget extends StatelessWidget {
  const Login_SignIn_With_Google_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialAuthButton_Widget(
      onTap: () {
        // authenticateWithGoogle(context);
      },
      color: const Color.fromRGBO(254, 78, 78, 1),
      child: Icon(
        FontAwesome.google,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
