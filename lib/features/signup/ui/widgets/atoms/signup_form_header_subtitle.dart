import 'package:flutter/material.dart';

class SignupFormHeaderSubtitle extends StatelessWidget {
  final String text;
  const SignupFormHeaderSubtitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //style: TextStyle(color: Theme.of(context).primaryColor),
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
          ),
    );
  }
}
