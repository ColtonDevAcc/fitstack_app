import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_username_textfield_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Personalize_Account_View extends StatelessWidget {
  const Personalize_Account_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignUp_Form_Header_Widget(
                  icon: FontAwesomeIcons.pencil,
                  text: 'Personalize your account',
                  subtitle: "Enter a username",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                SignUp_Username_Textfield_Widget(),
              ],
            );
          },
        ),
      ],
    );
  }
}
