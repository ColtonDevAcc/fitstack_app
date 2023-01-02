import 'package:FitStack/widgets/atoms/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialAuthButton(
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
