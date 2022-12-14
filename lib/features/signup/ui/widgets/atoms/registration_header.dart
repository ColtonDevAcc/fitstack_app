import 'package:flutter/material.dart';

class SignUpHeaderText extends StatelessWidget {
  final String? text;
  const SignUpHeaderText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'CREATE YOUR ACCOUNT',
      textScaleFactor: 1.2,
      //style: TextStyle(color: Theme.of(context).primaryColor),
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
