import 'package:flutter/material.dart';

class WorkoutCard extends StatefulWidget {
  WorkoutCard({Key? key}) : super(key: key);

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 200,
        maxWidth: 200,
      ),
      height: 200,
      width: 200,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
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
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,",
                    style: Theme.of(context).textTheme.subtitle2,
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
