import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/assigned_sex_button.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/dateofbirth_button.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/plat_health_fill_button.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_form_header.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BasicInfoFormView extends StatelessWidget {
  const BasicInfoFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignupFormHeader(
          subtitle: "Lets configure your account",
          text: "Lets configure your account",
          icon: FontAwesomeIcons.weightScale,
        ),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) => previous.formKey != current.formKey,
          builder: (context, state) {
            var formKey = state.formKey?[state.index];
            return Expanded(
              child: FormBuilder(
                autoFocusOnValidationFailure: true,
                autovalidateMode: AutovalidateMode.always,
                onChanged: () => BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey!),
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    PlatHealthFillButton(),
                    Spacer(flex: 1),
                    DateOfBirthButton(),
                    SizedBox(height: 10),
                    AssignedSexButton(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SignupTextfield(
                            onSubmitted: (p0) =>
                                BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey),
                            key: Key('Height'),
                            suffixText: 'ft',
                            title: 'Height',
                            fieldName: 'heightFt',
                            hintText: '0',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: "required"),
                            ]),
                            onChanged: (value) => BlocProvider.of<SignupCubit>(context)
                                .heightFtChanged(int.tryParse(value ?? "")),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          flex: 1,
                          child: SignupTextfield(
                            key: Key('In'),
                            suffixText: 'In',
                            title: "",
                            fieldName: "heightInch",
                            hintText: '0',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: "required"),
                            ]),
                            onChanged: (value) => BlocProvider.of<SignupCubit>(context)
                                .heightInchChanged(int.tryParse(value ?? "")),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SignupTextfield(
                      key: Key('Weight'),
                      title: "Weight",
                      fieldName: "weight",
                      suffixText: 'lb',
                      hintText: "000.0",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "required"),
                        FormBuilderValidators.max(500, errorText: "must be less than 500 lbs"),
                        FormBuilderValidators.min(90, errorText: "must be greater than 90 lbs")
                      ]),
                      onChanged: (value) => BlocProvider.of<SignupCubit>(context)
                          .weightChanged(int.tryParse(value ?? "0")?.toDouble()),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
