import 'dart:developer';

import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp_Focused_Button_Widget extends StatelessWidget {
  final String text;
  final int index;

  const SignUp_Focused_Button_Widget({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonSize = MediaQuery.of(context).size.width * 0.8;

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) => state.formKey?[state.index],
      buildWhen: (previous, current) =>
          previous.index != current.index || previous.authState != current.authState,
      builder: (context, state) {
        GlobalKey<FormBuilderState> formKey = state.formKey![state.index];
        log("form is valid: ${formKey.currentState!.isValid}");

        return TextButton(
          onPressed: () => BlocProvider.of<SignupCubit>(context).nextPage(context),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 20),
              ],
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(30),
            width: buttonSize,
            duration: Duration(milliseconds: 2000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                AnimatedContainer(
                  curve: Curves.bounceOut,
                  duration: Duration(milliseconds: 900),
                  width: state.index > 0 ? buttonSize * .684 : 20,
                ),
                if (state.index > 0)
                  AnimatedRotation(
                    duration: Duration(milliseconds: 300),
                    turns: formKey.currentState!.isValid ? 0 : -.25,
                    child: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 15,
                    ),
                  ),
                if (state.authState == AuthState.AUTHORIZING)
                  Container(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
