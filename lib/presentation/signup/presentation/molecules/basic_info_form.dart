import 'package:FitStack/presentation/signup/presentation/atoms/create_account_text_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_header_widget.dart';
import 'package:FitStack/widgets/atoms/FitStack_Logo_Widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:FitStack/widgets/atoms/focusedButton_widget.dart';
import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:FitStack/widgets/atoms/textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicInfoForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function()? googleOnTap;
  final void Function()? NextPageButtonOnPressed;

  BasicInfoForm({
    Key? key,
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SignUp_Header_Widget(),
        Expanded(
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                Spacer(flex: 1),
                SizedBox(height: 10),
                TextField_Widget(
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? 'Enter a valid email'
                        : null;
                  },
                  title: "Email",
                  hintText: "Email",
                ),
                SizedBox(height: 10),
                TextField_Widget(
                  title: "Password",
                  hintText: "Password",
                  validator: (value) {
                    return value != null && value.length < 6 ? "Enter min. 6 characters" : null;
                  },
                ),
                SizedBox(height: 10),
                TextField_Widget(
                  title: "Confirm Password",
                  hintText: "Confirm Password",
                  validator: (value) {
                    return value != null && value.length < 6 ? "Password must match" : null;
                  },
                ),
                SizedBox(height: 10),
                Spacer(flex: 3),
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
      ],
    );
  }
}
