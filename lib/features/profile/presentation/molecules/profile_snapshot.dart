import 'package:FitStack/features/profile/presentation/atoms/profile_featured_statistics_graph.dart';
import 'package:FitStack/features/profile/presentation/atoms/profile_social_currency_icon.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProfileSnapshot extends StatelessWidget {
  final String? avatar;
  final int daysInARow;
  final int fitCredits;
  final int socialPoints;
  final void Function()? avatarOnTap;
  const ProfileSnapshot({
    Key? key,
    this.avatarOnTap,
    required this.avatar,
    required this.daysInARow,
    required this.fitCredits,
    required this.socialPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: avatarOnTap,
              child: ProfileAvatar(
                maxRadius: 31,
                avatar: avatar,
                withBorder: true,
              ),
            ),
            ProfileSocialCurrencyIcon(icon: FontAwesome.chart_simple, value: "$socialPoints", color: Colors.blue),
            ProfileSocialCurrencyIcon(icon: FontAwesome.shekel_sign, value: "$fitCredits", color: Theme.of(context).colorScheme.secondary),
            ProfileSocialCurrencyIcon(icon: FontAwesome.fire_flame_curved, value: "$daysInARow", color: Theme.of(context).colorScheme.error),
            const SizedBox(),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileFeaturedStatisticsGraph(
              graphColor: Theme.of(context).colorScheme.error,
              measurementAbrv: 'lbs',
              subtitle: 'Weight Gain',
              value: '-40',
            ),
            const SizedBox(width: 10),
            ProfileFeaturedStatisticsGraph(
              graphColor: Theme.of(context).colorScheme.secondary,
              measurementAbrv: 'BMI',
              subtitle: 'body mass index',
              value: '-1.0',
            ),
            const SizedBox(width: 10),
            ProfileFeaturedStatisticsGraph(
              graphColor: Theme.of(context).colorScheme.primary,
              measurementAbrv: 'LBM',
              subtitle: 'lean body mass',
              value: '+5',
            ),
          ],
        ),
        const SizedBox(height: 30),
        Column(
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
      ],
    );
  }
}
