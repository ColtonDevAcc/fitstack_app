import 'package:FitStack/features/signup/state/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpFocusedButton extends StatelessWidget {
  final String text;
  final int index;

  const SignUpFocusedButton({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonSize = MediaQuery.of(context).size.width * 0.8;

    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        GlobalKey<FormBuilderState>? formKey = state.formKey![state.index];

        return TextButton(
          onPressed: () => BlocProvider.of<SignupCubit>(context).nextPage(context),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 20),
              ],
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(25),
            width: buttonSize,
            duration: Duration(milliseconds: 2000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                AnimatedContainer(
                  curve: Curves.bounceOut,
                  duration: Duration(milliseconds: 900),
                  width: formKey.currentState != null && formKey.currentState!.isValid ? buttonSize * .67 : 20,
                ),
                AnimatedRotation(
                  duration: Duration(milliseconds: 300),
                  turns: formKey.currentState != null && formKey.currentState!.isValid ? 0 : -.25,
                  child: Icon(
                    FontAwesome.arrow_right,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 15,
                  ),
                ),
                if (state.authState == AuthState.AUTHORIZING)
                  Container(
                    height: 14,
                    width: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
