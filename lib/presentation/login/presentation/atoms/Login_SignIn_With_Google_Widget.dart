import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_SignIn_With_Google_Widget extends StatelessWidget {
  const Login_SignIn_With_Google_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialAuthButton_Widget(
      onTap: () {
        // authenticateWithGoogle(context);
      },
      color: Color.fromRGBO(254, 78, 78, 1),
      child: FaIcon(
        FontAwesomeIcons.google,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
