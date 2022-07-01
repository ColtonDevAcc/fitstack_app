import 'package:auto_route/auto_route.dart';
import 'package:fitstackapp/widgets/atoms/focusedButton_widget.dart';
import 'package:fitstackapp/widgets/atoms/socialAuthButton_widget.dart';
import 'package:fitstackapp/widgets/atoms/textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicInfoForm extends StatelessWidget {
  BasicInfoForm({Key? key}) : super(key: key);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: SvgPicture.asset(
                'assets/app/icons/AppLogo.svg',
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'CREATE YOUR ACCOUNT',
              textScaleFactor: 1.6,
              //style: TextStyle(color: Theme.of(context).primaryColor),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Spacer(flex: 1),
            TextField_Widget(
              controller: emailController,
              title: "Email",
              hintText: "Email",
            ),
            TextField_Widget(
              controller: passController,
              title: "Password",
              hintText: "Password",
            ),
            TextField_Widget(
              controller: confirmPassController,
              title: "Confirm Password",
              hintText: "Confirm Password",
            ),
            Spacer(flex: 1),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
                  ),
                  text: "Don't have an account? ",
                  children: [
                    TextSpan(
                      text: "      Sign In!",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AutoRouter.of(context).pushNamed('/login');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: FocusedButton_Widget(
                text: "NEXT",
                onPressed: () {
                  // AutoRouter.of(context).pushNamed('/login');
                },
              ),
            ),
            SizedBox(height: 15),
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
                  color: Theme.of(context).colorScheme.secondary,
                  child: FaIcon(
                    FontAwesomeIcons.google,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
