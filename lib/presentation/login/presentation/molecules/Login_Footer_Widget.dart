import 'package:FitStack/presentation/login/presentation/atoms/Login_Account_SignUp_Text_Widget.dart';
import 'package:FitStack/presentation/login/presentation/atoms/Login_SignIn_Button_Widget.dart';
import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_Footer_Widget extends StatelessWidget {
  const Login_Footer_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Login_Account_SignUp_Text_Widget(),
        Login_SignIn_Button_Widget(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialAuthButton_Widget(
              color: Color.fromRGBO(45, 113, 197, 1),
              child: FaIcon(
                FontAwesomeIcons.facebookF,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(width: 15),
            SocialAuthButton_Widget(
              onTap: () {
                // authenticateWithGoogle(context);
              },
              color: Color.fromRGBO(254, 78, 78, 1),
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
