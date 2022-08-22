import 'dart:io';

import 'package:FitStack/app/bloc/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/organisms/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocProvider(
            create: (context) => SignupCubit(
              appBloc: BlocProvider.of<AppBloc>(context),
              authenticationRepository: context.read<AuthenticationRepository>(),
            ),
            child: SignUp_View(),
          ),
        ),
      ),
    );
  }
}
