import 'package:FitStack/features/nutrition/presentation/atoms/nutrients_score_chip.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/model/PerSize.dart';

class ProductNutrientsSnapshot extends StatelessWidget {
  final Nutriments? nutrients;
  const ProductNutrientsSnapshot({
    Key? key,
    required this.nutrients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final energyKcal = nutrients?.getValue(Nutrient.energyKCal, PerSize.serving);
    final energyKj = nutrients?.getValue(Nutrient.energyKJ, PerSize.serving);
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        runSpacing: 10,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          NutrientsScoreChip(
            icon: FontAwesome.fire,
            value: "${energyKcal ?? energyKj ?? 0} ${energyKcal != null ? "kcal" : "kJ"}",
          ),
          NutrientsScoreChip(
            icon: FontAwesome.drumstick_bite,
            value: "${nutrients?.getValue(Nutrient.proteins, PerSize.serving) ?? 0}g protein",
          ),
          NutrientsScoreChip(
            icon: FontAwesome.leaf,
            value: "${nutrients?.getValue(Nutrient.carbohydrates, PerSize.serving) ?? 0}g carbs",
          ),
          NutrientsScoreChip(
            icon: LineAwesome.prescription_bottle_solid,
            value: "${nutrients?.getValue(Nutrient.fat, PerSize.serving) ?? 0}g fat",
          ),
        ],
      ),
    );
  }
}
