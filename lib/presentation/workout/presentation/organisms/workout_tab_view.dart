import 'package:FitStack/presentation/workout/presentation/molecules/workout_card.dart';
import 'package:flutter/material.dart';

class WorkoutTabView extends StatelessWidget {
  const WorkoutTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              WorkoutCard(),
              WorkoutCard(),
              WorkoutCard(),
              WorkoutCard(),
            ],
          ),
        ),
      ],
    );
  }
}
