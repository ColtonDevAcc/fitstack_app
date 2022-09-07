import 'package:FitStack/presentation/workout/presentation/atoms/history_stepper_control_button.dart';
import 'package:FitStack/presentation/workout/presentation/molecules/workout_card.dart';
import 'package:flutter/material.dart';

class HistoryTabView extends StatelessWidget {
  const HistoryTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Stepper(
                  controlsBuilder: (context, details) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HistoryStepperControlButton(
                            title: 'View',
                            onTap: () {},
                          ),
                          HistoryStepperControlButton(
                            title: 'Share',
                            onTap: () {},
                          ),
                          HistoryStepperControlButton(
                            title: 'Analytics',
                            onTap: () {},
                          ),
                          HistoryStepperControlButton(
                            title: 'Delete',
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  },
                  type: StepperType.vertical,
                  steps: [
                    Step(
                      title: const Text('workout 1'),
                      subtitle: Text('10/05/1999'),
                      content: WorkoutCard(),
                    ),
                    Step(
                      title: const Text('workout 1'),
                      content: WorkoutCard(),
                    ),
                    Step(
                      title: const Text('workout 1'),
                      content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                    ),
                    Step(
                      title: const Text('workout 1'),
                      content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                    ),
                    Step(
                      title: const Text('workout 1'),
                      content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                    ),
                    Step(
                      title: const Text('workout 1'),
                      content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                    ),
                    Step(
                      title: const Text('workout 1'),
                      content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                    ),
                    Step(
                      title: const Text('workout 1'),
                      content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                    ),
                    Step(
                      title: const Text('workout 1'),
                      content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
