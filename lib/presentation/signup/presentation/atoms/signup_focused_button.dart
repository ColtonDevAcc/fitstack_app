import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp_Focused_Button_Widget extends StatelessWidget {
  final String text;
  final int index;

  const SignUp_Focused_Button_Widget({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonSize = MediaQuery.of(context).size.width * 0.8;
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            if (state.index == 0 &&
                state.dob != "" &&
                state.assignedSex != AssignedSex.Unknown &&
                state.heightFt != 0 &&
                state.weight != 0.0) {
              BlocProvider.of<SignupCubit>(context).changePage(state.index + 1);
            } else if (state.index == 1 && state.username != "") {
              BlocProvider.of<SignupCubit>(context).changePage(state.index + 1);
            } else if (state.index == 2 && state.firstLastName != "") {
              BlocProvider.of<SignupCubit>(context).changePage(state.index + 1);
            } else if (state.index == 3) {
              BlocProvider.of<SignupCubit>(context).changePage(state.index + 1);
            } else if (state.index == 4) {
              BlocProvider.of<SignupCubit>(context).changePage(state.index + 1);
            }
          },
          child: AnimatedContainer(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 20),
              ],
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(30),
            width: buttonSize,
            duration: Duration(milliseconds: 2000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                AnimatedContainer(
                  curve: Curves.bounceOut,
                  duration: Duration(milliseconds: 900),
                  width: state.index > 0 ? buttonSize * .684 : 20,
                ),
                if (state.index > 0)
                  AnimatedRotation(
                    duration: Duration(milliseconds: 300),
                    turns: state.formKey?[state.index].currentState != null
                        ? !state.formKey![state.index].currentState!.isValid
                            ? -.25
                            : 0
                        : 0,
                    child: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 15,
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
