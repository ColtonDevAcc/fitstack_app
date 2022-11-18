import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConsumptionStatisticCard extends StatelessWidget {
  const ConsumptionStatisticCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.fire,
          size: 30,
          color: Theme.of(context).colorScheme.error,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '9000',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Calories',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        )
      ],
    );
  }
}
