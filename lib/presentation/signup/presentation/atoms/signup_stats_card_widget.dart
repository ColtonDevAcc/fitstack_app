import 'package:flutter/material.dart';
import 'package:health/health.dart';

class SingUp_Stats_Card_widget extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final HealthDataPoint? healthData;
  const SingUp_Stats_Card_widget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.healthData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(subtitle),
          ],
        )
      ],
    );
  }
}
