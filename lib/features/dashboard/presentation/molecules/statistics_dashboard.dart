import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/providers/bloc/exercise/exercise_bloc.dart';
import 'package:FitStack/app/providers/bloc/user_recovery/user_recovery_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/progress_bar.dart';
import 'package:FitStack/features/recovery/presentation/atoms/recovery_svg_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsDashboard extends StatelessWidget {
  const StatisticsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> colorList = [
      Theme.of(context).colorScheme.tertiary,
      Colors.deepOrangeAccent,
      Colors.green,
    ];
    return BlocBuilder<UserRecoveryBloc, UserRecoveryState>(
      builder: (context, state) {
        final muscleList = state.userRecovery.muscles;
        // ignore: unnecessary_statements
        muscleList.length > 1 ? muscleList.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!)) : null;
        return Row(
          children: [
            RecoverySvgPainter(
              height: 200,
              width: 100,
              muscleAnatomyViewRotationIndex: 0,
              recovery: state.userRecovery,
              //TODO: backMuscleList should be state.backMuscleList
              backMuscleList: const [],
              frontMuscleList: state.frontMuscleList,
              majorMuscleColor: Theme.of(context).colorScheme.tertiary,
              minorMuscleColor: Colors.yellow,
              onMajorMuscleSelected: (TapUpDetails tapUpDetails, Muscle muscle) =>
                  context.read<ExerciseBloc>().add(SelectMajorMuscle(muscle: muscle)),
              onMinorMuscleSelected: (longPressDetails, muscle) => context.read<ExerciseBloc>().add(SelectMinorMuscle(muscle: muscle)),
              muscleColorList: colorList,
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: state.userRecovery.muscles
                  .map(
                    (e) => ProgressBar(
                      totalValue: 100,
                      partialValue: 25,
                      muscle: e,
                      rawMuscleList: state.frontMuscleList,
                      muscleColorList: colorList,
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
