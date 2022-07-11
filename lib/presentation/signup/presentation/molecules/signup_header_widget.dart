import 'package:FitStack/presentation/signup/presentation/atoms/create_account_text_widget.dart';
import 'package:FitStack/widgets/atoms/FitStack_Logo_Widget.dart';
import 'package:flutter/material.dart';

class SignUp_Header_Widget extends StatelessWidget {
  const SignUp_Header_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FitStack_Logo_Widget(),
        Create_Account_Text_Widget(),
      ],
    );
  }
}
