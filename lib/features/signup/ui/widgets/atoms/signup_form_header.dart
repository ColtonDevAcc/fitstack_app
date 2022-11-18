import 'package:FitStack/features/signup/state/signup_cubit.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/create_account_text.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/signup_form_header_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
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
                    FaIcon(
                      FontAwesomeIcons.arrowLeftLong,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 18,
                    ),
                    Text("${state.index} / ${state.indexRange}")
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: FaIcon(icon, color: Theme.of(context).colorScheme.primary)),
                SizedBox(width: 5),
                SignUp_Header_Text_Widget(text: text),
              ],
            ),
            SizedBox(height: 10),
            Signup_Form_Header_Subtitle_Widget(text: subtitle),
          ],
        );
      },
    );
  }
}
