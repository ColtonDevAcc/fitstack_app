import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Social_Auth_Buttons extends StatelessWidget {
  const Social_Auth_Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 900),
          //TODO make this size the size of the login row for auth buttons
          height: state.index == 0 ? MediaQuery.of(context).size.height * .045 : 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialAuthButton_Widget(
                color: Theme.of(context).colorScheme.primary,
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(width: 15),
              SocialAuthButton_Widget(
                onTap: () {},
                color: Theme.of(context).colorScheme.secondary,
                child: FaIcon(
                  FontAwesomeIcons.google,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
