import 'package:FitStack/features/nutrition/presentation/atoms/nutrients_score_chip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        children: [
          NutrientsScoreChip(
            icon: FontAwesome.fire_flame_simple,
            value: "${energyKcal ?? energyKj ?? 0} ${energyKcal != null ? "kcal" : "kJ"}",
          ),
          NutrientsScoreChip(
            icon: FontAwesomeIcons.avocado,
            value: "${nutrients?.getValue(Nutrient.proteins, PerSize.serving) ?? 0}g protein",
          ),
          NutrientsScoreChip(
            icon: FontAwesomeIcons.wheat,
            value: "${nutrients?.getValue(Nutrient.carbohydrates, PerSize.serving) ?? 0}g carbs",
          ),
          NutrientsScoreChip(
            icon: FontAwesomeIcons.pizzaSlice,
            value: "${nutrients?.getValue(Nutrient.fat, PerSize.serving) ?? 0}g fat",
          ),
        ],
      ),
    );
  }
}
