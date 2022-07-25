import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/assigned_sex_button.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/dateofbirth_button.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/height_textfield.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/plat_health_fill_button.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/weight_textfield.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicInfoForm extends StatefulWidget {
  final void Function()? googleOnTap;
  final void Function()? NextPageButtonOnPressed;

  BasicInfoForm({
    Key? key,
    this.NextPageButtonOnPressed,
    this.googleOnTap,
  }) : super(key: key);

  @override
  State<BasicInfoForm> createState() => _BasicInfoFormState();
}

class _BasicInfoFormState extends State<BasicInfoForm> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SignUp_Header_Widget(),
            Expanded(
              child: Form(
                key: state.formKey?[state.index],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 1),
                    PlatHealthFillButton(),
                    SizedBox(height: 10),
                    DateOfBirthButton(),
                    SizedBox(height: 10),
                    AssignedSexButton(),
                    SizedBox(height: 10),
                    HeightTextfield(),
                    SizedBox(height: 10),
                    WeightTextfield(),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
                  ),
                  text: "Don't have an account? ",
                  children: [
                    TextSpan(
                      text: "      Sign In!",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AutoRouter.of(context).pushNamed('/');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
