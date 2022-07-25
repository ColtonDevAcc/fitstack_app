import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightTextfield extends StatelessWidget {
  const HeightTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.heightFt != current.heightFt || previous.heightInch != current.heightInch,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Height',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) => BlocProvider.of<SignupCubit>(context)
                        .heightFtChanged(int.tryParse(value) ?? 0),
                    style: Theme.of(context).textTheme.subtitle2,
                    decoration: InputDecoration(
                      hintText: "${state.heightFt}",
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
                              "ft",
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
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) => BlocProvider.of<SignupCubit>(context)
                        .heightInchChanged(double.tryParse(value) ?? 0),
                    style: Theme.of(context).textTheme.subtitle2,
                    decoration: InputDecoration(
                      hintText: "${state.heightInch}",
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
                              "in",
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
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
