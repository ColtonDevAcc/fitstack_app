import 'dart:io';

import 'package:FitStack/app/bloc/app_bloc.dart';
import 'package:FitStack/app/injection/dependency_injection.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/presentation/login/presentation/organisms/login_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocConsumer<AppBloc, AppState>(
            listener: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                AutoRouter.of(context).pushNamed("/mainView");
              }
            },
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return Login_View();
            },
          ),
        ),
      ),
    );
  }
}
