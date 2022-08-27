import 'package:flutter/material.dart';

class Workout_Recommendation_Card extends StatefulWidget {
  Workout_Recommendation_Card({Key? key}) : super(key: key);

  @override
  State<Workout_Recommendation_Card> createState() => Workout_Recommendation_Card_State();
}

class Workout_Recommendation_Card_State extends State<Workout_Recommendation_Card> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
            image: AssetImage('assets/app/images/Workout.jpg'),
            height: 140,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Title",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  "Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet, consetetur sadipscing elitr,Lorem ipsum dolor sit amet, consetetur sadipscing elitr,",
                  overflow: TextOverflow.fade,
                  //TODO: determine how many lines we can have by doing magic math with mediaquery
                  maxLines: 4,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
