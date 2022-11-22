import 'package:FitStack/features/workout/ui/widgets/atoms/circular_statistics_progressIndicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WorkoutStatisticsSnapshot extends StatelessWidget {
  const WorkoutStatisticsSnapshot({
    Key? key,
    required this.minFontSize,
    required this.maxFontSize,
  }) : super(key: key);

  final double minFontSize;
  final double maxFontSize;

  @override
  Widget build(BuildContext context) {
    const labelSize = 15.0;
    const valueSize = 19.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  text: "260 lbs\n",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: valueSize, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "Current weight",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: labelSize),
                    ),
                  ],
                ),
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
              ),
              AutoSizeText.rich(
                TextSpan(
                  text: "280 lbs\n",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: valueSize, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "Goal weight",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: labelSize),
                    ),
                  ],
                ),
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
              ),
              AutoSizeText(
                "Edit Goal",
                minFontSize: minFontSize,
                maxFontSize: maxFontSize,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        AutoSizeText(
          'Goals Achieved',
          minFontSize: minFontSize,
          maxFontSize: maxFontSize,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: AutoSizeText.rich(
                  TextSpan(
                    text: "3/7\n",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: valueSize, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "Week",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: labelSize),
                      ),
                    ],
                  ),
                  minFontSize: minFontSize,
                  maxFontSize: maxFontSize,
                ),
              ),
              CircularStatisticsProgressIndicator(
                ratio: 20,
                innerColor: Color.fromRGBO(15, 186, 184, 1),
                outerColor: Theme.of(context).colorScheme.primary,
                label: 'M',
              ),
              CircularStatisticsProgressIndicator(
                ratio: 20,
                innerColor: Color.fromRGBO(15, 186, 184, 1),
                outerColor: Theme.of(context).colorScheme.primary,
                label: 'T',
              ),
              CircularStatisticsProgressIndicator(
                ratio: 20,
                innerColor: Color.fromRGBO(15, 186, 184, 1),
                outerColor: Theme.of(context).colorScheme.primary,
                label: 'W',
              ),
              CircularStatisticsProgressIndicator(
                ratio: 20,
                innerColor: Color.fromRGBO(15, 186, 184, 1),
                outerColor: Theme.of(context).colorScheme.primary,
                label: 'T',
              ),
              CircularStatisticsProgressIndicator(
                ratio: 20,
                innerColor: Color.fromRGBO(15, 186, 184, 1),
                outerColor: Theme.of(context).colorScheme.primary,
                label: 'F',
              ),
              CircularStatisticsProgressIndicator(
                ratio: 20,
                innerColor: Color.fromRGBO(15, 186, 184, 1),
                outerColor: Theme.of(context).colorScheme.primary,
                label: 'S',
              ),
              CircularStatisticsProgressIndicator(
                ratio: 20,
                innerColor: Color.fromRGBO(15, 186, 184, 1),
                outerColor: Theme.of(context).colorScheme.primary,
                label: 'S',
              ),
            ],
          ),
        )
      ],
    );
  }
}
