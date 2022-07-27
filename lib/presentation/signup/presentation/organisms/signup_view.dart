import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_focused_button.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/basic_info_form.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/social_auth_buttons.dart';
import 'package:FitStack/presentation/signup/presentation/organisms/health_stats_form_view.dart';
import 'package:FitStack/presentation/signup/presentation/organisms/first_last_name_form_view.dart';
import 'package:FitStack/presentation/signup/presentation/organisms/user_account_auth_form_view.dart';
import 'package:FitStack/presentation/signup/presentation/organisms/username_form_view.dart';
import 'package:FitStack/presentation/signup/presentation/organisms/upload_picture_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp_View extends StatelessWidget {
  const SignUp_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> forms = [
      UserAccountAuthFormView(),
      BasicInfoForm(),
      UsernameFormView(),
      FirstLastNameFormView(),
      UploadPictureFormView(),
      HealthStatsFormView(),
    ];

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        if (state.indexRange < 2) {
          BlocProvider.of<SignupCubit>(context).setIndexRange(forms.length);
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Expanded(child: forms[state.index]),
              SignUp_Focused_Button_Widget(text: 'Next', index: state.index),
              Social_Auth_Buttons()
            ],
          ),
        );
      },
    );
  }
}
