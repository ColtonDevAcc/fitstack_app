import 'dart:developer';

import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:FitStack/widgets/atoms/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UserAccountAuthFormView extends StatelessWidget {
  const UserAccountAuthFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignupFormHeader(
          icon: FontAwesomeIcons.lock,
          text: 'Account',
          subtitle: 'Let\'s secure your account',
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: BlocBuilder<SignupCubit, SignupState>(
            buildWhen: (previous, current) =>
                previous.formKey![previous.index] != current.formKey![current.index] ||
                previous.password != current.password,
            builder: (context, state) {
              log("${state.password}");
              var formKey = state.formKey![state.index];
              return FormBuilder(
                autovalidateMode: AutovalidateMode.always,
                onChanged: () {
                  BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey);
                },
                key: formKey,
                child: Column(
                  children: [
                    TextField_Widget(
                      onChanged: (email) =>
                          BlocProvider.of<SignupCubit>(context).emailChanged(email),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "required"),
                        FormBuilderValidators.email(errorText: "Must be a valid email"),
                      ]),
                      title: 'Email',
                      hintText: "email",
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextField_Widget(
                            onChanged: (pass) =>
                                BlocProvider.of<SignupCubit>(context).passwordChanged(pass),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: "required"),
                              FormBuilderValidators.minLength(
                                6,
                                errorText: "Must be greater than 6 characters",
                                allowEmpty: false,
                              )
                            ]),
                            title: 'Password',
                            hintText: "password",
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextField_Widget(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: "required"),
                              FormBuilderValidators.match(
                                state.password,
                                errorText: "Password must match",
                              )
                            ]),
                            title: 'Confirm Password',
                            hintText: "confirm password",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
