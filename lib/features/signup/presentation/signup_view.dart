import 'package:fitstackapp/features/signup/presentation/widgets/organisms/basic_info_form.dart';
import 'package:flutter/material.dart';

class SignUp_View extends StatelessWidget {
  const SignUp_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          BasicInfoForm(),
        ],
      ),
    );
  }
}
