import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssignedSexButton extends StatelessWidget {
  const AssignedSexButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.assignedSex != current.assignedSex,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assigned Sex',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  value: state.assignedSex == AssignedSex.Unknown ? null : state.assignedSex,
                  buttonPadding: EdgeInsets.all(10),
                  itemHeight: 40,
                  isDense: false,
                  isExpanded: true,
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  iconSize: 15,
                  hint: Text(
                    'Choose from list',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  icon: Icon(FontAwesomeIcons.angleDown),
                  items: [
                    DropdownMenuItem(
                      enabled: true,
                      child: Text(
                        'Male',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      value: AssignedSex.Male,
                    ),
                    DropdownMenuItem(
                      enabled: true,
                      child: Text(
                        'Female',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      value: AssignedSex.Female,
                    ),
                  ],
                  onChanged: (dynamic value) =>
                      BlocProvider.of<SignupCubit>(context).assignedSexChanged(value),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
