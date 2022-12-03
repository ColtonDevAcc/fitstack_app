import 'package:FitStack/features/nutrition/presentation/atoms/consumption_statistic_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class UserConsumptionChart extends StatelessWidget {
  final List<Product> products;
  const UserConsumptionChart({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> nutrients = {};
    products.map((e) => e.nutriments?.toJson()).forEach((element) {
      nutrients['Calories'] = element?['energy-kcal_serving'] ?? 0;
      nutrients['Protein'] = element?['proteins_serving'] ?? 0;
      nutrients['Carbs'] = element?['carbohydrates_serving'] ?? 0;
      nutrients['Fat'] = element?['fat_serving'] ?? 0;
      nutrients['Fiber'] = element?['fiber_serving'] ?? 0;
      nutrients['Sodium'] = element?['sodium_serving'] ?? 0;
      nutrients['Sugar'] = element?['sugars_serving'] ?? 0;
      nutrients['caffeine'] = element?['caffeine_serving'] ?? 0;
      nutrients['calcium'] = element?['calcium_serving'] ?? 0;
    });

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
        children: nutrients.entries
            .map(
              (e) => SizedBox(
                width: MediaQuery.of(context).size.width * .3 - 30,
                child: ConsumptionStatisticCard(
                  title: e.key,
                  value: e.value.toString(),
                  icon: nutritionToIconMap[e.key] ?? Icon(FontAwesomeIcons.question),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

const Map<String, Icon> nutritionToIconMap = {
  'Calories': Icon(
    FontAwesomeIcons.fire,
    color: Colors.red,
    size: 25,
  ),
  'Protein': Icon(
    FontAwesomeIcons.cow,
    color: Colors.green,
    size: 25,
  ),
  'Carbs': Icon(
    FontAwesomeIcons.breadSliceButter,
    color: Colors.orange,
    size: 25,
  ),
  'Fat': Icon(
    FontAwesomeIcons.pizzaSlice,
    color: Colors.purple,
    size: 25,
  ),
  'Fiber': Icon(
    FontAwesomeIcons.wheat,
    color: Colors.green,
    size: 25,
  ),
  'Sodium': Icon(
    FontAwesomeIcons.saltShaker,
    color: Colors.blue,
    size: 25,
  ),
  'Sugar': Icon(
    FontAwesomeIcons.candyCane,
    color: Colors.pink,
    size: 25,
  ),
  'caffeine': Icon(
    FontAwesomeIcons.coffeePot,
    color: Colors.brown,
    size: 25,
  ),
  'calcium': Icon(
    FontAwesomeIcons.eggFried,
    color: Colors.yellow,
    size: 25,
  ),
};
