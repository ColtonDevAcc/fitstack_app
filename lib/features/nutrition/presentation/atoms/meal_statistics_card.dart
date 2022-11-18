import 'package:flutter/material.dart';

class MealStatisticsCard extends StatelessWidget {
  const MealStatisticsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.width * .45,
      width: MediaQuery.of(context).size.width * .5 - 30,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    'Meal 1',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.2,
                  ),
                  Spacer(flex: 1),
                  Text(
                    '800g',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.1,
                  ),
                  Text('Calories', style: Theme.of(context).textTheme.labelLarge),
                  Spacer(flex: 1),
                  Text(
                    '186g',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.1,
                  ),
                  Text('Protein', style: Theme.of(context).textTheme.labelLarge),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Text(
                'Edit',
                textScaleFactor: 1.2,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
