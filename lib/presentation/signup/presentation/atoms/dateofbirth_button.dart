import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DateOfBirthButton extends StatelessWidget {
  const DateOfBirthButton({Key? key}) : super(key: key);

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
            SizedBox(height: 10),
            FormBuilderDateTimePicker(
              resetIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(FontAwesomeIcons.angleDown, size: 15),
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
              name: 'dateOfBirth',
              decoration: InputDecoration(
                hintText: "select a date",
                suffixIconConstraints: BoxConstraints(maxHeight: 30, maxWidth: 40),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(FontAwesomeIcons.calendar),
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
