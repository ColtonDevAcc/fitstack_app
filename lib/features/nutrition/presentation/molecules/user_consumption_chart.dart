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
      child: Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        alignment: WrapAlignment.spaceBetween,
        children: [
          ConsumptionStatisticCard(
            title: 'Calories',
            value: (nutrients['Calories'] ?? 0).toString(),
            icon: Icon(
              FontAwesomeIcons.fire,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ConsumptionStatisticCard(
            title: 'Protein',
            value: (nutrients['Protein'] ?? 0).toString(),
            icon: Icon(
              FontAwesomeIcons.cow,
              color: Colors.brown,
            ),
          ),
          ConsumptionStatisticCard(
            title: 'Carbs',
            value: (nutrients['Carbs'] ?? 0).toString(),
            icon: Icon(
              FontAwesomeIcons.breadSlice,
              color: Colors.amber,
            ),
          ),
          ConsumptionStatisticCard(
            title: 'Fat',
            value: (nutrients['Fat'] ?? 0).toString(),
            icon: Icon(
              FontAwesomeIcons.pizzaSlice,
              color: Colors.deepOrange,
            ),
          ),
          ConsumptionStatisticCard(
            title: 'Fiber',
            value: (nutrients['Fiber'] ?? 0).toString(),
            icon: Icon(
              FontAwesomeIcons.wheat,
              color: Colors.orange,
            ),
          ),
          ConsumptionStatisticCard(
            title: 'Sodium',
            value: (nutrients['Sodium'] ?? 0).toString(),
            icon: Icon(
              FontAwesomeIcons.saltShaker,
              color: Colors.blue,
            ),
          ),
        ],
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
