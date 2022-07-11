import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Create_Account_Text_Widget extends StatelessWidget {
  const Create_Account_Text_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'CREATE YOUR ACCOUNT',
      textScaleFactor: 1.6,
      //style: TextStyle(color: Theme.of(context).primaryColor),
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
