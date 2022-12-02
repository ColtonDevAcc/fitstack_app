import 'package:FitStack/features/signup/state/signup_cubit.dart';
import 'package:FitStack/widgets/atoms/socialAuthButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.decelerate,
          height: state.index == 0 ? MediaQuery.of(context).size.height * .045 : 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.index == 0)
                SocialAuthButton_Widget(
                  color: Theme.of(context).colorScheme.primary,
                  child: Icon(
                    FontAwesome.facebook_f,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              if (state.index == 0) SizedBox(width: 15),
              if (state.index == 0)
                SocialAuthButton_Widget(
                  onTap: () {},
                  color: Theme.of(context).colorScheme.secondary,
                  child: Icon(
                    FontAwesome.google,
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
