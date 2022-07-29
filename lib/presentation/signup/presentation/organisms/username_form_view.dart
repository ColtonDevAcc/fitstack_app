import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_fullscreen_textfield.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_form_header.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SignupFormHeader(
          icon: FontAwesomeIcons.pencil,
          text: 'Username',
          subtitle: "Enter a username",
        ),
        Spacer(flex: 1),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) => previous.username != current.username,
          builder: (context, state) {
            GlobalKey<FormBuilderState>? formKey = state.formKey?[state.index];
            return FormBuilder(
              autoFocusOnValidationFailure: true,
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              onChanged: () => BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey!),
              child: SignUp_Fullscreen_Textfield_Widget(
                key: Key("usernameForm"),
                onChanged: (p0) => BlocProvider.of<SignupCubit>(context).usernameChanged(p0 ?? ""),
                name: 'username',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(errorText: "required"),
                    FormBuilderValidators.maxLength(15,
                        errorText: "Must be less than 15 character"),
                    FormBuilderValidators.minLength(4,
                        errorText: "Must be greater than 4 characters")
                  ],
                ),
              ),
            );
          },
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
