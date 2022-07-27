import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signUp_fullscreen_textfield_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PersonalInfoFormView extends StatelessWidget {
  const PersonalInfoFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SignupFormHeader(
          icon: FontAwesomeIcons.weightScale,
          text: "Personal Data",
          subtitle: "What is your first and last name?",
        ),
        Spacer(flex: 1),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) => previous.firstLastName != current.firstLastName,
          builder: (context, state) {
            var form = state.formKey?[state.index];
            return FormBuilder(
              autovalidateMode: AutovalidateMode.always,
              key: form,
              child: SignUp_Fullscreen_Textfield_Widget(
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "required"),
                  FormBuilderValidators.compose([
                    (value) {
                      RegExp pattern = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");
                      if (pattern.hasMatch(value ?? "")) {
                        return "is good";
                      } else {
                        return "you must enter your first and last name separated by a space";
                      }
                    },
                  ]),
                ]),
                onChanged: (val) =>
                    BlocProvider.of<SignupCubit>(context).firstLastNameChanged(val ?? ""),
              ),
            );
          },
        ),
        Spacer(flex: 1),
      ],
    );
  }
}
