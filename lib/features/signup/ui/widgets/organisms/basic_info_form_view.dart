import 'package:FitStack/features/signup/state/signup_cubit.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/assigned_sex_button.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/dateofbirth_button.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/plat_health_fill_button.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/signup_form_header.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BasicInfoFormView extends StatelessWidget {
  const BasicInfoFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignupFormHeader(
          subtitle: "Enter you basic information",
          text: "Lets configure your account",
          icon: FontAwesome.weight_scale,
        ),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) =>
              previous.formKey?[previous.index].currentState?.value != current.formKey?[current.index].currentState?.value,
          builder: (context, state) {
            final formKey = state.formKey?[state.index];
            return Expanded(
              child: FormBuilder(
                autoFocusOnValidationFailure: true,
                autovalidateMode: AutovalidateMode.always,
                onChanged: () => BlocProvider.of<SignupCubit>(context).formKeyChanged(formKey!),
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const PlatHealthFillButton(),
                    const Spacer(),
                    const DateOfBirthButton(),
                    const SizedBox(height: 10),
                    const AssignedSexButton(),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SignupTextfield(
                            key: const Key('Height'),
                            suffixText: 'ft',
                            title: 'Height',
                            fieldName: 'heightFt',
                            hintText: '0',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: "required"),
                            ]),
                            onChanged: (value) => BlocProvider.of<SignupCubit>(context).heightFtChanged(int.tryParse(value ?? "")),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: SignupTextfield(
                            key: const Key('In'),
                            suffixText: 'In',
                            title: "",
                            fieldName: "heightInch",
                            hintText: '0',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(errorText: "required"),
                            ]),
                            onChanged: (value) => BlocProvider.of<SignupCubit>(context).heightInchChanged(int.tryParse(value ?? "")),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SignupTextfield(
                      key: const Key('Weight'),
                      title: "Weight",
                      fieldName: "weight",
                      suffixText: 'lb',
                      hintText: "000.0",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "required"),
                        FormBuilderValidators.max(500, errorText: "must be less than 500 lbs"),
                        FormBuilderValidators.min(90, errorText: "must be greater than 90 lbs")
                      ]),
                      onChanged: (value) => BlocProvider.of<SignupCubit>(context).weightChanged(int.tryParse(value ?? "0")?.toDouble()),
                    ),
                    const Spacer(flex: 2),
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
