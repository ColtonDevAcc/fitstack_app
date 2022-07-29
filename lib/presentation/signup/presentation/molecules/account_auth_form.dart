import 'dart:developer';

import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/widgets/atoms/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AccountAuthFrom extends StatelessWidget {
  const AccountAuthFrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) => log("${state.formKey![state.index].currentState?.isValid}"),
      buildWhen: (previous, current) =>
          previous.index != current.index || previous.formKey != current.formKey,
      builder: (context, state) {
        var formKey = state.formKey![state.index];
        return FormBuilder(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey);
          },
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField_Widget(
                onChanged: (email) => BlocProvider.of<SignupCubit>(context).emailChanged(email),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "required"),
                  FormBuilderValidators.email(errorText: "Must be a valid email"),
                ]),
                title: 'Email',
                hintText: "email",
              ),
              SizedBox(height: 15),
              TextField_Widget(
                keyboardType: TextInputType.phone,
                onChanged: (phoneNumber) =>
                    BlocProvider.of<SignupCubit>(context).phoneNumberChanged(phoneNumber),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "required"),
                  FormBuilderValidators.compose([
                    (value) {
                      RegExp pattern = RegExp(r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$");
                      if (pattern.hasMatch(value ?? "")) {
                        return null;
                      } else {
                        return "must be a valid phone number: (123) 456-7890";
                      }
                    },
                  ]),
                ]),
                title: 'Phone Number',
                hintText: "phone number",
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
    );
  }
}
