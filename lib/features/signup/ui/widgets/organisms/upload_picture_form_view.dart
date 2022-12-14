import 'package:FitStack/features/signup/state/signup_cubit.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/profile_avatar_widget.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/signup_form_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';

class UploadPictureFormView extends StatelessWidget {
  const UploadPictureFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignupFormHeader(
          icon: FontAwesome.camera,
          text: 'Upload your avatar',
          subtitle: 'Upload a supported image',
        ),
        const Spacer(),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) {
            return previous.profileImage != current.profileImage;
          },
          builder: (context, state) {
            final formKey = state.formKey?[state.index];
            formKey?.currentState?.validate();
            return FormBuilder(
              key: formKey,
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<SignupCubit>(context).changeProfileImage(context);
                },
                child: ProfileAvatar(
                  maxRadius: 50,
                  avatar: state.profileImage,
                  withBorder: false,
                ),
              ),
            );
          },
        ),
        const Spacer()
      ],
    );
  }
}
