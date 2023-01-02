import 'package:FitStack/features/dashboard/presentation/atoms/habit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HabitsList extends StatelessWidget {
  const HabitsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text('Your habits', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.primary)),
          ),
          Flexible(
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                HabitCard(
                  onTap: () => context.pushNamed('statistic_report'),
                  height: 130,
                  child: [
                    Text('Daily Report', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(30)),
                        child: const Icon(FontAwesomeIcons.solidArrowRight, color: Colors.white, size: 12),
                      ),
                    )
                  ],
                ),
                HabitCard(
                  height: 160,
                  color: const Color.fromRGBO(234, 248, 253, 1),
                  child: [
                    Icon(FontAwesomeIcons.personRunning, color: Theme.of(context).colorScheme.primary, size: 30),
                    const Spacer(),
                    Text('Running', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
                    Text('3 days', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
                HabitCard(
                  height: 160,
                  color: const Color.fromRGBO(254, 241, 250, 1),
                  child: [
                    Icon(FontAwesomeIcons.dumbbell, color: Theme.of(context).colorScheme.primary, size: 30),
                    const Spacer(),
                    Text('Workout', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
                    Text('35 mins', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
                HabitCard(
                  height: 130,
                  color: const Color.fromRGBO(226, 244, 226, 1),
                  child: [
                    Icon(FontAwesomeIcons.avocado, color: Theme.of(context).colorScheme.primary, size: 30),
                    const Spacer(),
                    Text('Nutrition', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
