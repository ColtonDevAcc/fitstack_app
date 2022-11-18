import 'package:FitStack/features/nutrition/presentation/atoms/meal_statistics_card.dart';
import 'package:flutter/material.dart';

class RecentMealsList extends StatelessWidget {
  const RecentMealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.start,
      alignment: WrapAlignment.spaceBetween,
      spacing: 20,
      runSpacing: 20,
      children: [
        MealStatisticsCard(),
        MealStatisticsCard(),
        MealStatisticsCard(),
      ],
    );
  }
}
