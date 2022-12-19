import 'dart:io';
import 'package:FitStack/features/login/presentation/organisms/login_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          // ignore: use_named_constants
          padding: Platform.isAndroid ? const EdgeInsets.fromLTRB(0, 10, 0, 10) : const EdgeInsets.all(0),
          child: const LoginView(),
        ),
      ),
    );
  }
}
