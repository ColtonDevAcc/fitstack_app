import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfileFeaturedUserStatistics extends StatelessWidget {
  final String statisticValue;
  final String? statisticMeasurement;
  final String subtitle;
  const ProfileFeaturedUserStatistics({
    Key? key,
    required this.statisticValue,
    this.statisticMeasurement,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText.rich(
          TextSpan(
            text: '$statisticValue',
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: statisticMeasurement == null ? null : " $statisticMeasurement",
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              ),
            ],
          ),
        ),
        Text(subtitle),
      ],
    );
  }
}
