import 'package:flutter/material.dart';
import 'package:health/health.dart';

class SingUp_Stats_Card_widget extends StatelessWidget {
  final Icon icon;
  final HealthDataPoint? healthData;
  const SingUp_Stats_Card_widget({
    Key? key,
    required this.icon,
    this.healthData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map healthType = {};
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
              "${healthData?.type.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("${healthData?.value}"),
          ],
        )
      ],
    );
  }
}
