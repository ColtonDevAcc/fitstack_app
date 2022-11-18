import 'package:FitStack/widgets/atoms/fitStack_Logo_Widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Login_Header_Widget extends StatelessWidget {
  const Login_Header_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FitStack_Logo_Widget(),
        SizedBox(height: 15),
        AutoSizeText(
          'LETS SIGN YOU IN,',
          maxFontSize: 90,
          minFontSize: 40,
          maxLines: 1,
          //style: TextStyle(color: Theme.of(context).primaryColor),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        SizedBox(height: 15),
        Text(
          'Welcome Back you\'ve\nbeen missed!',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
              ),
        ),
      ],
    );
  }
}
