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
    final Map<String, Map<String, Icon>> types = {
      "ACTIVE_ENERGY_BURNED": {
        "ACALORIES": const Icon(
          FontAwesome.fire,
          color: Colors.red,
        )
      },
      "BODY_FAT_PERCENTAGE": {
        "BFP": const Icon(
          FontAwesome.percent,
          color: Colors.amber,
        )
      },
      "BODY_MASS_INDEX": {
        "BMI": const Icon(
          FontAwesome.scale_unbalanced,
          color: Colors.black,
        )
      },
      "HEIGHT": {
        "HEIGHT": const Icon(
          FontAwesome.ruler,
          color: Colors.yellow,
        )
      },
      "STEPS": {
        "STEPS": const Icon(
          FontAwesome.person_walking,
          color: Colors.purple,
        )
      },
      "WORKOUT": {
        "WORKOUT": const Icon(
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

    final NumericHealthValue healthValue = healthData!.value as NumericHealthValue;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (types[healthData?.type.name] != null) types[healthData?.type.name]!.values.toList().first else const Icon(
                FontAwesome.dumbbell,
              ),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${types[healthData?.type.name]?.keys.toList().first ?? healthData?.type.name}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("${healthValue.numericValue.toInt()}"),
          ],
        )
      ],
    );
  }
}
