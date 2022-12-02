import 'package:FitStack/features/signup/ui/widgets/atoms/signup_form_header.dart';
import 'package:FitStack/features/signup/ui/widgets/molecules/account_auth_form.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class UserAccountAuthFormView extends StatelessWidget {
  const UserAccountAuthFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignupFormHeader(
          icon: FontAwesome.lock,
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
