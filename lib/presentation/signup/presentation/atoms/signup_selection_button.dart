import 'package:flutter/material.dart';

class Signup_Selection_Button_Widget extends StatelessWidget {
  final String text;
  const Signup_Selection_Button_Widget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text),
          ],
        ),
      ),
    );
  }
}
