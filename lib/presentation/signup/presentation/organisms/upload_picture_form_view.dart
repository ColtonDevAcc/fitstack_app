import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_form_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadPictureFormView extends StatelessWidget {
  const UploadPictureFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignupFormHeader(
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
            var formKey = state.formKey?[state.index];
            formKey?.currentState?.validate();
            return FormBuilder(
              key: formKey,
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<SignupCubit>(context).changeProfileImage(context);
                },
                child: ProfileAvatar(
                  maxRadius: 50,
                  profileUrl: context.read<AppBloc>().state.user?.photo_url,
                  withBorder: false,
                ),
              ),
            );
          },
        ),
        Spacer(flex: 1)
      ],
    );
  }
}
