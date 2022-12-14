import 'package:FitStack/app/providers/bloc/nutrition/nutrition_bloc.dart';
import 'package:FitStack/features/nutrition/presentation/atoms/meal_statistics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/PerSize.dart';

class RecentProductList extends StatelessWidget {
  const RecentProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionBloc, NutritionState>(
      builder: (context, state) {
        return Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 20,
          runSpacing: 20,
          children: state.recentProducts.isEmpty
              ? []
              : state.recentProducts.map(
                  (meal) {
                    return MealStatisticsCard(
                      productName: meal.productName,
                      calories: meal.nutriments == null
                          ? "${meal.nutriments?.getValue(Nutrient.energyKCal, PerSize.serving) ?? 0} kcal"
                          : "${meal.nutriments?.getValue(Nutrient.energyKJ, PerSize.serving) ?? 0} kJ",
                      protein: "${meal.nutriments?.getValue(Nutrient.proteins, PerSize.serving) ?? 0} g",
                    );
                  },
                ).toList()
            ..add(
              MealStatisticsCard(
                empty: true,
                onTap: () => context.push('/nutrition/scan'),
              ),
            ),
        );
      },
    );
  }
}
