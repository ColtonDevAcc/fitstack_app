import 'package:FitStack/features/signup/state/signup_cubit.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/signup_form_header.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/signup_fullscreen_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FirstLastNameFormView extends StatelessWidget {
  const FirstLastNameFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SignupFormHeader(
          icon: FontAwesome.weight_scale,
          text: "Personal Data",
          subtitle: "What is your first and last name?",
        ),
        const Spacer(),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) => previous.firstLastName != current.firstLastName,
          builder: (context, state) {
            final formKey = state.formKey?[state.index];
            return FormBuilder(
              onChanged: () => BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey),
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: SignUpFullscreenTextfield(
                name: 'firstLastName',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "required"),
                  FormBuilderValidators.compose([
                    (value) {
                      final RegExp pattern = RegExp(r"^[A-Z][a-z]+\s[A-Z][a-z]+$");
                      if (pattern.hasMatch(value ?? "")) {
                        return null;
                      } else {
                        return "you must enter your first and last name separated by a space";
                      }
                    },
                  ]),
                ]),
                onChanged: (val) => BlocProvider.of<SignupCubit>(context).firstLastNameChanged(val ?? ""),
              ),
            );
          },
        ),
        const Spacer(),
      ],
    );
  }
}
