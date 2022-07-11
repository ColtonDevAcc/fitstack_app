import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp_Focused_Button_Widget extends StatelessWidget {
  final String text;
  final int index;
  final void Function()? onPressed;
  const SignUp_Focused_Button_Widget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonSize = MediaQuery.of(context).size.width * 0.8;
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextButton(
          onPressed: onPressed,
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
                  FaIcon(
                    FontAwesomeIcons.arrowRight,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 15,
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}