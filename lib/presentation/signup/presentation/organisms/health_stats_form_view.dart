import 'package:FitStack/presentation/signup/presentation/molecules/signup_form_header_widget.dart';
import 'package:FitStack/presentation/signup/presentation/molecules/signup_statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Health_Stats_Form_View extends StatelessWidget {
  const Health_Stats_Form_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignUp_Form_Header_Widget(
          icon: FontAwesomeIcons.personRunning,
          text: 'Statistics',
          subtitle: 'Lets import your progress',
        ),
        Spacer(flex: 1),
        Text(
          "Here is what we were able to retrieve",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
              ),
        ),
        SizedBox(height: 10),
        signUp_Statistics_Widget(),
        Spacer(flex: 1),
      ],
    );
  }
}
