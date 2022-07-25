import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_header_widget.dart';
import 'package:FitStack/widgets/atoms/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserAccountAuthFormView extends StatelessWidget {
  const UserAccountAuthFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignUp_Form_Header_Widget(
          icon: FontAwesomeIcons.lock,
          text: 'Account',
          subtitle: 'Lets finish up your account',
        ),
        Spacer(flex: 1),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return TextField_Widget(
              onChanged: (p0) => BlocProvider.of<SignupCubit>(context).passwordChanged(p0),
              title: 'Email',
              hintText: "email",
            );
          },
        ),
        SizedBox(height: 15),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) => previous.password != current.password,
          builder: (context, state) {
            return TextField_Widget(
              title: 'Password',
              hintText: "password",
            );
          },
        ),
        SizedBox(height: 15),
        TextField_Widget(
          title: 'Confirm Password',
          hintText: "confirm password",
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
