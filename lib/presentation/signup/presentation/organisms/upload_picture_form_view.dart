import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Upload_Picture_Form_View extends StatelessWidget {
  const Upload_Picture_Form_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignUp_Form_Header_Widget(
          icon: FontAwesomeIcons.camera,
          text: 'Upload your avatar',
          subtitle: 'Upload a supported image',
        ),
        Spacer(flex: 1),
        Profile_Avatar_Widget(maxRadius: 50),
        Spacer(flex: 1)
      ],
    );
  }
}
