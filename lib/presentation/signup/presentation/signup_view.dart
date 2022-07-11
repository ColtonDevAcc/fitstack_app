import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/organisms/basic_info_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp_View extends StatefulWidget {
  const SignUp_View({Key? key}) : super(key: key);

  @override
  State<SignUp_View> createState() => _SignUp_ViewState();
}

class _SignUp_ViewState extends State<SignUp_View> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  PageController pageController = PageController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> forms = [
      BasicInfoForm(
        formKey: formKey,
        NextPageButtonOnPressed: () {
          pageController.nextPage(
            duration: Duration(seconds: 1),
            curve: Curves.ease,
          );
        },
        // googleOnTap: () => authenticateWithGoogle(context),
        confirmPassController: confirmPassController,
        emailController: emailController,
        passController: passController,
        usernameController: usernameController,
      ),
      Container(
        height: 200,
        width: 200,
        color: Colors.red,
      )
    ];

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  if (value == 1) {
                    authenticateWithEmailAndPassword(context);
                  }
                },
                itemBuilder: (BuildContext context, int index) {
                  return forms[index];
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void authenticateWithEmailAndPassword(context) {
    if (formKey.currentState!.validate()) {
      // If email is valid adding new event [SignUpRequested].
      context.read<LoginState>().signIn(emailController.value, passController.value);
    }
  }

//! TODO: implemnt google sign in
  // void authenticateWithGoogle(context) {
  //   BlocProvider.of<AuthBloc>(context).add(
  //     GoogleSignInRequested(),
  //   );
  // }
}
