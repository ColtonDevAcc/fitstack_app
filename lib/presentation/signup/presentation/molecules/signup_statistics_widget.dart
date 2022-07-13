import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/signup/presentation/atoms/signup_stats_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class signUp_Statistics_Widget extends StatelessWidget {
  const signUp_Statistics_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.healthData != current.healthData,
      builder: (context, state) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
                onTap: () => BlocProvider.of<SignupCubit>(context).healthDataChanged(),
                child: Wrap(
                  children: state.healthData != null
                      ? state.healthData!
                          .map(
                            (e) => SingUp_Stats_Card_widget(
                              icon: Icon(
                                FontAwesomeIcons.personWalking,
                                color: Colors.red,
                              ),
                              title:
                                  '${state.healthData == null ? null : state.healthData?.first.value}',
                              subtitle: 'Steps',
                              healthData: state.healthData?.first,
                            ),
                          )
                          .toList()
                      : [],
                )),
          ),
        );
      },
    );
  }
}
