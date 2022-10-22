import 'package:FitStack/presentation/workout/presentation/molecules/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              GestureDetector(
                onTap: () => context.go('/programs/workout'),
                child: WorkoutCard(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
