import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WorkoutRecommendationCard extends StatefulWidget {
  const WorkoutRecommendationCard({Key? key}) : super(key: key);

  @override
  State<WorkoutRecommendationCard> createState() => WorkoutRecommendationCardState();
}

class WorkoutRecommendationCardState extends State<WorkoutRecommendationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Ink.image(
            image: const AssetImage('assets/app/images/Workout.jpg'),
            height: 140,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      "Title",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: AutoSizeText(
                      "Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet, consetetur sadipscing elitr,Lorem ipsum dolor sit amet, consetetur sadipscing elitr,",
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
