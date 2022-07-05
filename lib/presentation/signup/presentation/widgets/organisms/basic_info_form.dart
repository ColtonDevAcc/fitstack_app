import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fitstackapp/widgets/atoms/focusedButton_widget.dart';
import 'package:fitstackapp/widgets/atoms/socialAuthButton_widget.dart';
import 'package:fitstackapp/widgets/atoms/textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicInfoForm extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController confirmPassController;
  final TextEditingController passController;
  final GlobalKey<FormState> formKey;
  final void Function()? googleOnTap;
  final void Function()? NextPageButtonOnPressed;

  BasicInfoForm({
    Key? key,
    required this.usernameController,
    required this.emailController,
    required this.confirmPassController,
    required this.passController,
    this.NextPageButtonOnPressed,
    this.googleOnTap,
    required this.formKey,
  }) : super(key: key);

  @override
  State<BasicInfoForm> createState() => _BasicInfoFormState();
}

class _BasicInfoFormState extends State<BasicInfoForm> {
  @override
  void dispose() {
    widget.usernameController.dispose();
    widget.emailController.dispose();
    widget.passController.dispose();
    widget.confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Expanded(
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                Spacer(flex: 1),
                TextField_Widget(
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? 'Enter a valid email'
                        : null;
                  },
                  controller: widget.emailController,
                  title: "Email",
                  hintText: "Email",
                ),
                SizedBox(height: 10),
                TextField_Widget(
                  controller: widget.passController,
                  title: "Password",
                  hintText: "Password",
                  validator: (value) {
                    return value != null && value.length < 6 ? "Enter min. 6 characters" : null;
                  },
                ),
                SizedBox(height: 10),
                TextField_Widget(
                  controller: widget.confirmPassController,
                  title: "Confirm Password",
                  hintText: "Confirm Password",
                  validator: (value) {
                    return value != null && value.length < 6 ? "Password must match" : null;
                  },
                ),
                SizedBox(height: 10),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
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
                      AutoRouter.of(context).pushNamed('/');
                    },
                ),
              ],
            ),
          ),
        ),
        Center(
          child: FocusedButton_Widget(text: "NEXT", onPressed: widget.NextPageButtonOnPressed),
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
              onTap: widget.googleOnTap,
              color: Theme.of(context).colorScheme.secondary,
              child: FaIcon(
                FontAwesomeIcons.google,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
