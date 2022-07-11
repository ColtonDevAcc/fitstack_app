import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Social_Auth_Buttons extends StatelessWidget {
  final int index;
  const Social_Auth_Buttons({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        if (index == 0)
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
                onTap: () {},
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
