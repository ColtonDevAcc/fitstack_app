import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class WeightTextfield extends StatelessWidget {
  const WeightTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.weight != current.weight ||
          previous.formKey?[current.index] != previous.formKey?[current.index],
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weight',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FormBuilderTextField(
              name: 'lb',
              keyboardType: TextInputType.number,
              onChanged: (value) => BlocProvider.of<SignupCubit>(context)
                  .weightChanged(double.tryParse(value ?? "0") ?? 0),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "required"),
                FormBuilderValidators.numeric(errorText: "Must be a number"),
                FormBuilderValidators.max(500, errorText: "Must be less than 600lbs")
              ]),
              style: Theme.of(context).textTheme.subtitle2,
              decoration: InputDecoration(
                hintText: "${state.weight}",
                suffixIconConstraints: BoxConstraints(maxHeight: 30, maxWidth: 40),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).colorScheme.secondary),
                    ),
                    child: Center(
                      child: Text(
                        "lb",
                        textScaleFactor: .8,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
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
