import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup_health_Statistics extends StatelessWidget {
  const Signup_health_Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.healthData != current.healthData,
      builder: (context, state) {
        state.formKey?[state.index].currentState?.validate();

        if (state.healthData == null) {
          BlocProvider.of<SignupCubit>(context).healthDataChanged(null);
        }
        return Expanded(
          child: GestureDetector(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Wrap(
                runAlignment: WrapAlignment.start,
                spacing: 1,
                runSpacing: 10,
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: state.healthData != null
                    ? state.healthData!
                        .map(
                          (healthPoint) => SingUp_Stats_Card_widget(
                            healthData: healthPoint,
                          ),
                        )
                        .toList()
                    : [],
              ),
            ),
          ),
        );
      },
    );
  }
}
