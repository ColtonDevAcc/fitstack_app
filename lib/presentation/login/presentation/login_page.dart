import 'dart:io';

import 'package:FitStack/app/injection/dependency_injection.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/presentation/login/presentation/organisms/login_view.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatelessWidget {
  Login_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getIt<AuthenticationRepository>().persistLogin();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: Platform.isAndroid ? const EdgeInsets.fromLTRB(0, 10, 0, 10) : EdgeInsets.all(0),
          child: Login_View(),
        ),
      ),
    );
  }
}
