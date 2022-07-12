import 'dart:developer';

import 'package:FitStack/app/routing/appRouter.gr.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp_Username_Textfield_Widget extends StatelessWidget {
  const SignUp_Username_Textfield_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) {
        log("${current.username}");
        return previous.username != current.username;
      },
      builder: (context, state) {
        return TextField(
          onChanged: (pass) => context.read<SignupCubit>().usernameChanged(pass),
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Enter here',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0),
              ),
            ),
          ),
        );
      },
    );
  }
}
