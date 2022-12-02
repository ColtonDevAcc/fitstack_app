import 'package:FitStack/features/signup/ui/widgets/atoms/signup_form_header.dart';
import 'package:FitStack/features/signup/ui/widgets/molecules/signup_health_statistics.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HealthStatsFormView extends StatelessWidget {
  const HealthStatsFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignupFormHeader(
          icon: FontAwesome.person_running,
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
        Signup_health_Statistics(),
        Spacer(flex: 1),
      ],
    );
  }
}
