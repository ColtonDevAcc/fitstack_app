import 'package:FitStack/features/signup/state/signup_cubit.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/registration_header.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/signup_form_header_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class SignupFormHeader extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subtitle;
  const SignupFormHeader({
    Key? key,
    required this.icon,
    required this.text,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<SignupCubit>(context).previousPage(context);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesome.arrow_left_long,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 18,
                    ),
                    Text("${state.index} / ${state.indexRange}")
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Center(child: Icon(icon, color: Theme.of(context).colorScheme.primary)),
                const SizedBox(width: 5),
                SignUpHeaderText(text: text),
              ],
            ),
            const SizedBox(height: 10),
            SignupFormHeaderSubtitle(text: subtitle),
          ],
        );
      },
    );
  }
}
