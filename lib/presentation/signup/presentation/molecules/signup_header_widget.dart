import 'package:FitStack/presentation/signup/presentation/atoms/create_account_text_widget.dart';
import 'package:FitStack/widgets/atoms/FitStack_Logo_Widget.dart';
import 'package:flutter/material.dart';

class SignUp_Header_Widget extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  const SignUp_Header_Widget({Key? key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title ?? FitStack_Logo_Widget(),
        subtitle ?? SignUp_Header_Text_Widget(),
      ],
    );
  }
}
