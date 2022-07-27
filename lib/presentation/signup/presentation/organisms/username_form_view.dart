import 'dart:developer';

import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signUp_fullscreen_textfield_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UsernameFormView extends StatelessWidget {
  const UsernameFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            GlobalKey<FormBuilderState>? formKey = state.formKey?[state.index];

            return FormBuilder(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              onChanged: () => BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignupFormHeader(
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
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(errorText: "required"),
                            FormBuilderValidators.maxLength(15,
                                errorText: "Must be less than 15 character"),
                            FormBuilderValidators.minLength(4,
                                errorText: "Must be greater than 4 characters")
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
