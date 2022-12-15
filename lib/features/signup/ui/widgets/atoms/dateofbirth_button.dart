import 'package:FitStack/features/signup/state/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DateOfBirthButton extends StatelessWidget {
  final AutovalidateMode? autovalidateMode;
  const DateOfBirthButton({Key? key, this.autovalidateMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.dob != current.dob,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date of Birth',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FormBuilderDateTimePicker(
              autovalidateMode: autovalidateMode ?? AutovalidateMode.always,
              name: 'dateOfBirth',
              resetIcon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(FontAwesome.angle_down, size: 15),
              ),
              onChanged: (value) => BlocProvider.of<SignupCubit>(context).dateOfBirthChanged(value),
              inputType: InputType.date,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "required"),
              ]),
              style: Theme.of(context).textTheme.subtitle2,
              initialDatePickerMode: DatePickerMode.year,
              firstDate: DateTime.utc(1960),
              lastDate: DateTime.now(),
              format: DateFormat('MM/dd/yyyy'),
              decoration: InputDecoration(
                hintText: "select a date",
                suffixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 40),
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(FontAwesome.calendar),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        );
      },
    );
  }
}
