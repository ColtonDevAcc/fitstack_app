import 'package:flutter/material.dart';

class SignUp_Header_Text_Widget extends StatelessWidget {
  final String? text;
  const SignUp_Header_Text_Widget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'CREATE YOUR ACCOUNT',
      textScaleFactor: 1.6,
      //style: TextStyle(color: Theme.of(context).primaryColor),
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
