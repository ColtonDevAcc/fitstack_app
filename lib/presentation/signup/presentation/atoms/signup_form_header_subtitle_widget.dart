import 'package:flutter/material.dart';

class Signup_Form_Header_Subtitle_Widget extends StatelessWidget {
  final String text;
  const Signup_Form_Header_Subtitle_Widget({Key? key, required this.text}) : super(key: key);

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
