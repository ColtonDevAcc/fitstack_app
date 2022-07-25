import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DateOfBirthButton extends StatelessWidget {
  const DateOfBirthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.dob != current.dob,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              context: context,
              builder: (ctx) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: SfDateRangePicker(
                            onSelectionChanged: (date) {
                              String _date =
                                  DateFormat('dd, MMMM yyyy').format(date.value).toString();
                              BlocProvider.of<SignupCubit>(context).dateOfBirthChanged(_date);
                            },
                            onCancel: () => Navigator.pop(context),
                            onSubmit: (date) {
                              String _date =
                                  DateFormat('dd, MMMM yyyy').format(date as DateTime).toString();
                              BlocProvider.of<SignupCubit>(context).dateOfBirthChanged(_date);
                              Navigator.pop(context);
                            },
                            showActionButtons: true,
                            confirmText: "OK",
                            cancelText: "CANCEL",
                            selectionMode: DateRangePickerSelectionMode.single,
                            view: DateRangePickerView.year,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date of Birth',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.surface,
                ),
                height: MediaQuery.of(context).size.height * .055,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.dob == "" ? 'Choose a date' : "${state.dob}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    if (state.dob == "") Icon(FontAwesomeIcons.angleDown, size: 15),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
