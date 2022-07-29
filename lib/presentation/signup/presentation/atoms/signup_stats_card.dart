import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/health.dart';

class SingUp_Stats_Card_widget extends StatelessWidget {
  final HealthDataPoint? healthData;
  const SingUp_Stats_Card_widget({
    Key? key,
    this.healthData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, Icon>> types = {
      "ACTIVE_ENERGY_BURNED": {
        "ACALORIES": Icon(
          FontAwesomeIcons.fire,
          color: Colors.red,
        )
      },
      "BODY_FAT_PERCENTAGE": {
        "BFP": Icon(
          FontAwesomeIcons.percent,
          color: Colors.amber,
        )
      },
      "BODY_MASS_INDEX": {
        "BMI": Icon(
          FontAwesomeIcons.scaleUnbalanced,
          color: Colors.black,
        )
      },
      "HEIGHT": {
        "HEIGHT": Icon(
          FontAwesomeIcons.ruler,
          color: Colors.yellow,
        )
      },
      "STEPS": {
        "STEPS": Icon(
          FontAwesomeIcons.personWalking,
          color: Colors.purple,
        )
      },
      "WORKOUT": {
        "WORKOUT": Icon(
          FontAwesomeIcons.dumbbell,
          color: Colors.black,
        )
      },
      "WEIGHT": {
        "WEIGHT": Icon(
          FontAwesomeIcons.weightScale,
          color: Theme.of(context).colorScheme.secondary,
        )
      },
    };

    NumericHealthValue healthValue = healthData!.value as NumericHealthValue;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        types[healthData?.type.name] != null
            ? types[healthData?.type.name]!.values.toList().first
            : Icon(
                FontAwesomeIcons.dumbbell,
              ),
        SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${types[healthData?.type.name]?.keys.toList().first ?? healthData?.type.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("${healthValue.numericValue.toInt()}"),
          ],
        )
      ],
    );
  }
}
