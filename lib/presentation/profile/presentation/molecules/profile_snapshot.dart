import 'package:FitStack/app/models/user_model.dart';
import 'package:FitStack/presentation/profile/presentation/atoms/profile_featured_statistics_graph.dart';
import 'package:FitStack/presentation/profile/presentation/atoms/profile_social_currency_icon.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSnapshot extends StatelessWidget {
  final void Function()? avatarOnTap;
  final String? profileUrl;
  const ProfileSnapshot({Key? key, this.avatarOnTap, required this.profileUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: avatarOnTap,
              child: ProfileAvatar(
                maxRadius: 31,
                profileUrl: profileUrl,
                withBorder: true,
              ),
            ),
            ProfileSocialCurrencyIcon(icon: FontAwesomeIcons.chartSimple, value: "15", color: Colors.blue),
            ProfileSocialCurrencyIcon(icon: FontAwesomeIcons.shekelSign, value: "39", color: Theme.of(context).colorScheme.secondary),
            ProfileSocialCurrencyIcon(icon: FontAwesomeIcons.fireFlameCurved, value: "4", color: Theme.of(context).colorScheme.error),
            SizedBox(),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileFeaturedStatisticsGraph(
              graphColor: Theme.of(context).colorScheme.error,
              measurementAbrv: 'lbs',
              subtitle: 'Weight Gain',
              value: '-40',
            ),
            SizedBox(width: 10),
            ProfileFeaturedStatisticsGraph(
              graphColor: Theme.of(context).colorScheme.secondary,
              measurementAbrv: 'BMI',
              subtitle: 'body mass index',
              value: '-1.0',
            ),
            SizedBox(width: 10),
            ProfileFeaturedStatisticsGraph(
              graphColor: Theme.of(context).colorScheme.primary,
              measurementAbrv: 'LBM',
              subtitle: 'lean body mass',
              value: '+5',
            ),
          ],
        ),
        SizedBox(height: 30),
        Container(
          child: Column(
            children: [
              LinearProgressIndicator(value: .2, backgroundColor: Theme.of(context).colorScheme.onBackground.withOpacity(.08)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'xp',
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '20/100',
                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}