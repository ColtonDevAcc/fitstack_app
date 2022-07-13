import 'dart:io';

import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) {
            return previous.profileImage != current.profileImage;
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<SignupCubit>(context).changeProfileImage();
              },
              child: Profile_Avatar_Widget(
                maxRadius: 50,
                image: state.profileImage?.path != null
                    ? Image.file(
                        File(state.profileImage!.path),
                      ).image
                    : null,
              ),
            );
          },
        ),
        Spacer(flex: 1)
      ],
    );
  }
}
