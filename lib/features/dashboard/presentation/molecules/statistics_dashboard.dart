import 'dart:developer';

import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/providers/bloc/exercise/exercise_bloc.dart';
import 'package:FitStack/app/providers/bloc/user_recovery/user_recovery_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/progress_bar.dart';
import 'package:FitStack/features/recovery/presentation/atoms/recovery_container.dart';
import 'package:FitStack/features/workout/ui/widgets/atoms/exercise_muscle_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class StatisticsDashboard extends StatelessWidget {
  const StatisticsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<UserRecoveryBloc, UserRecoveryState>(
          builder: (context, state) {
            return RecoveryContainer(
              height: 200,
              width: 100,
              muscleAnatomyViewRotationIndex: 0,
              recovery: state.userRecovery,
              backMuscleList: const [],
              frontMuscleList: state.frontMuscleList,
              majorMuscleColor: Theme.of(context).colorScheme.tertiary,
              minorMuscleColor: Colors.yellow,
              onMajorMuscleSelected: (TapUpDetails tapUpDetails, Muscle muscle) =>
                  context.read<ExerciseBloc>().add(SelectMajorMuscle(muscle: muscle)),
              onMinorMuscleSelected: (longPressDetails, muscle) => context.read<ExerciseBloc>().add(SelectMinorMuscle(muscle: muscle)),
            );
          },
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressBar(barColor: Theme.of(context).colorScheme.tertiary, totalValue: 100, partialValue: 25, icon: FontAwesome.record_vinyl),
          ],
        ),
      ],
    );
  }
}
