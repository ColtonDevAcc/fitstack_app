import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
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
          FontAwesome.fire,
          color: Colors.red,
        )
      },
      "BODY_FAT_PERCENTAGE": {
        "BFP": Icon(
          FontAwesome.percent,
          color: Colors.amber,
        )
      },
      "BODY_MASS_INDEX": {
        "BMI": Icon(
          FontAwesome.scale_unbalanced,
          color: Colors.black,
        )
      },
      "HEIGHT": {
        "HEIGHT": Icon(
          FontAwesome.ruler,
          color: Colors.yellow,
        )
      },
      "STEPS": {
        "STEPS": Icon(
          FontAwesome.person_walking,
          color: Colors.purple,
        )
      },
      "WORKOUT": {
        "WORKOUT": Icon(
          FontAwesome.dumbbell,
          color: Colors.black,
        )
      },
      "WEIGHT": {
        "WEIGHT": Icon(
          FontAwesome.weight_scale,
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
                FontAwesome.dumbbell,
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
