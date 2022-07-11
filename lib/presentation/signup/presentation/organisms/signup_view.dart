import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_focused_button.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/basic_info_form.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/social_auth_buttons.dart';
import 'package:FitStack/presentation/signup/presentation/organisms/personalize_account_view.dart';
import 'package:FitStack/widgets/atoms/focusedButton_widget.dart';
import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp_View extends StatelessWidget {
  const SignUp_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    List<Widget> forms = [
      BasicInfoForm(
        formKey: formKey,
      ),
      Personalize_Account_View()
    ];

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Expanded(
                child: forms[state.index],
              ),
              SignUp_Focused_Button_Widget(
                text: 'Next',
                onPressed: () {
                  BlocProvider.of<SignupCubit>(context).changePage(state.index + 1);
                },
                index: state.index,
              ),
              Social_Auth_Buttons()
            ],
          ),
        );
      },
    );
  }
}
