import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AccountAuthFrom extends StatelessWidget {
  const AccountAuthFrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.formKey?[previous.index].currentState?.value != current.formKey?[current.index].currentState?.value,
      builder: (context, state) {
        var formKey = state.formKey![state.index];
        return FormBuilder(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () => BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey),
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SignupTextfield(
                onChanged: (email) => BlocProvider.of<SignupCubit>(context).emailChanged(email),
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "required"),
                  FormBuilderValidators.email(errorText: "Must be a valid email"),
                ]),
                title: 'Email',
                hintText: "email",
              ),
              SizedBox(height: 15),
              SignupTextfield(
                keyboardType: TextInputType.phone,
                onChanged: (phoneNumber) => BlocProvider.of<SignupCubit>(context).phoneNumberChanged(phoneNumber),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "required"),
                  FormBuilderValidators.compose([
                    (value) {
                      RegExp pattern = RegExp(r"^\+[1-9]\d{1,14}$");
                      if (pattern.hasMatch(value ?? "")) {
                        return null;
                      } else {
                        return "must be a valid phone number: 8989829304";
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
                    child: SignupTextfield(
                      keyboardType: TextInputType.text,
                      onChanged: (pass) => BlocProvider.of<SignupCubit>(context).passwordChanged(pass),
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
                    child: SignupTextfield(
                      keyboardType: TextInputType.text,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "required"),
                        (value) => value == formKey.currentState?.fields['Password']?.value ? null : "Passwords must match",
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
