import 'dart:io';
import 'package:flutter/material.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({Key? key}) : super(key: key);

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: Platform.isAndroid ? const EdgeInsets.fromLTRB(0, 10, 0, 10) : EdgeInsets.all(0),
          child: SignUp_Page(),
        ),
      ),
    );
  }
}
