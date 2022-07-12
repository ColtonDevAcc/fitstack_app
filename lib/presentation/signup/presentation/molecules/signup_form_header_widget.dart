import 'package:FitStack/app/routing/appRouter.gr.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/create_account_text_widget.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_form_header_subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp_Form_Header_Widget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subtitle;
  const SignUp_Form_Header_Widget({
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
                BlocProvider.of<SignupCubit>(context).changePage(state.index - 1);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: FaIcon(
                  FontAwesomeIcons.arrowLeftLong,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 18,
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
