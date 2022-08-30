import 'package:FitStack/presentation/nutrition/presentation/atoms/consumption_statistic_card.dart';
import 'package:flutter/material.dart';

class UserConsumptionChart extends StatelessWidget {
  const UserConsumptionChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(1, 3),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.spaceBetween,
        children: [
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
          ConsumptionStatisticCard(),
        ],
      ),
    );
  }
}
