import 'package:FitStack/presentation/nutrition/presentation/molecules/recent_meals_list.dart';
import 'package:FitStack/presentation/nutrition/presentation/molecules/user_consumption_chart.dart';
import 'package:flutter/material.dart';

class NutritionView extends StatelessWidget {
  const NutritionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double bottomPadding = 17;
    const double topPadding = 25;
    const double textLabelScale = 1.2;
    TextStyle labelTextStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.bold,
        );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nutrition",
                        textScaleFactor: 1.3,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, topPadding - 5, 0, bottomPadding),
                    child: Text(
                      "Consumption",
                      textScaleFactor: textLabelScale,
                      style: labelTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: UserConsumptionChart(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, topPadding - 5, 0, bottomPadding),
                    child: Text(
                      "Recent Meals",
                      textScaleFactor: textLabelScale,
                      style: labelTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: RecentMealsList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
