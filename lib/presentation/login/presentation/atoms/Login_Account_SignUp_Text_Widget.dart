import 'package:FitStack/app/routing/appRouter.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login_Account_SignUp_Text_Widget extends StatelessWidget {
  const Login_Account_SignUp_Text_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
          ),
          text: "Don't have an account? ",
          children: [
            TextSpan(
              text: "      Sign Up!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AutoRouter.of(context).pushNamed("/signup");
                },
            ),
          ],
        ),
      ),
    );
  }
}
