import 'dart:developer';

import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signUp_fullscreen_textfield_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Username_Form_View extends StatelessWidget {
  const Username_Form_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            GlobalKey<FormBuilderState>? formKey = state.formKey?[state.index];
            if (formKey == null) {
              log("form key null");
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignUp_Form_Header_Widget(
                  icon: FontAwesomeIcons.pencil,
                  text: 'Username',
                  subtitle: "Enter a username",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                BlocBuilder<SignupCubit, SignupState>(
                  buildWhen: (previous, current) {
                    return previous.username != current.username;
                  },
                  builder: (context, state) {
                    return SignUp_Fullscreen_Textfield_Widget(
                      onChanged: (val) {
                        BlocProvider.of<SignupCubit>(context).usernameChanged(val ?? "");
                      },
                      formKey: formKey ?? GlobalKey<FormBuilderState>(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
