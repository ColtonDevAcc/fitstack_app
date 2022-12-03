import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MealStatisticsCard extends StatelessWidget {
  final String? productName;
  final String? calories;
  final String? protein;
  final bool? empty;
  final void Function()? onTap;
  const MealStatisticsCard({Key? key, this.empty, this.onTap, this.productName, this.calories, this.protein}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = productName?.split(" ");
    return empty == false || empty == null
        ? GestureDetector(
            onTap: onTap,
            child: Container(
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
                          AutoSizeText(
                            "${name?[0] ?? ""} ${name?[1] ?? ""}",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.2,
                          ),
                          Spacer(flex: 1),
                          AutoSizeText(
                            '$calories',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.1,
                          ),
                          AutoSizeText('Calories', style: Theme.of(context).textTheme.labelLarge),
                          Spacer(flex: 1),
                          AutoSizeText(
                            '${protein}g',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.1,
                          ),
                          AutoSizeText('Protein', style: Theme.of(context).textTheme.labelLarge),
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
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
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
                      child: Center(
                        child: Icon(FontAwesome.plus),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
