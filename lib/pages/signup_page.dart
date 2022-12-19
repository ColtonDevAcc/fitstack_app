import 'dart:io';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          // ignore: use_named_constants
          padding: Platform.isAndroid ? const EdgeInsets.fromLTRB(0, 10, 0, 10) : const EdgeInsets.all(0),
          child: const SignUpPage(),
        ),
      ),
    );
  }
}
