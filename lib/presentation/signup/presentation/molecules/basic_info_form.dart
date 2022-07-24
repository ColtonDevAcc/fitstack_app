import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/dateofbirth_button_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:FitStack/widgets/atoms/textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
                    SizedBox(height: 10),
                    DateOfBirthButtonWidget(),
                    SizedBox(height: 10),
                    TextField_Widget(
                      title: "Password",
                      hintText: "Password",
                      validator: (value) {
                        return value != null && value.length < 6 ? "Enter min. 6 characters" : null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextField_Widget(
                      title: "Confirm Password",
                      hintText: "Confirm Password",
                      validator: (value) {
                        return value != null && value.length < 6 ? "Password must match" : null;
                      },
                    ),
                    SizedBox(height: 10),
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
