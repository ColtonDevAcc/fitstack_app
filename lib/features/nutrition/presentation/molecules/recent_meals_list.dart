import 'package:FitStack/app/providers/bloc/bloc/nutrition_bloc.dart';
import 'package:FitStack/features/nutrition/presentation/atoms/meal_statistics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecentMealsList extends StatelessWidget {
  const RecentMealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionBloc, NutritionState>(
      builder: (context, state) {
        return Wrap(
          runAlignment: WrapAlignment.start,
          alignment: WrapAlignment.spaceBetween,
          spacing: 20,
          runSpacing: 20,
          children: state.recentMeals.isEmpty
              ? []
              : state.recentMeals
                  .map((meal) {
                    return MealStatisticsCard();
                  })
                  .toList()
                  .cast()
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
