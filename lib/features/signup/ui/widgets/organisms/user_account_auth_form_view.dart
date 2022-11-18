import 'package:FitStack/features/signup/ui/molecules/account_auth_form.dart';
import 'package:FitStack/features/signup/ui/atoms/signup_form_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserAccountAuthFormView extends StatelessWidget {
  const UserAccountAuthFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignupFormHeader(
          icon: FontAwesomeIcons.lock,
          text: 'Account',
          subtitle: 'Let\'s secure your account',
        ),
        Spacer(flex: 1),
        AccountAuthFrom(),
        Spacer(flex: 2),
      ],
    );
  }
}
