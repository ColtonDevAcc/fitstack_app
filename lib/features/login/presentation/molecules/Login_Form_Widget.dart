import 'package:FitStack/features/login/presentation/atoms/Login_Email_Field_Widget.dart';
import 'package:FitStack/features/login/presentation/atoms/Login_Password_Field_Widget.dart';
import 'package:flutter/material.dart';

class Login_Form_Widget extends StatelessWidget {
  const Login_Form_Widget({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          Login_Email_Field_Widget(),
          SizedBox(height: 15),
          Login_Password_Field_Widget(),
        ],
      ),
    );
  }
}
