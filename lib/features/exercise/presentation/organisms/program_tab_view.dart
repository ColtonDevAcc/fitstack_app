import 'dart:developer';

import 'package:FitStack/features/exercise/cubit/program_cubit.dart';
import 'package:FitStack/features/exercise/presentation/molecules/program_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProgramTabView extends StatelessWidget {
  const ProgramTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramCubit, ProgramState>(
      buildWhen: (previous, current) => previous.programs != current.programs,
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            if (state.status != ProgramStatus.loading)
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: state.programs == null
                    ? []
                    : state.programs!
                        .map(
                          (program) => GestureDetector(
                            onTap: () => context.go('/programs/workout'),
                            child: ProgramCard(
                              description: program.creator?.profile.displayName ?? "Community",
                              title: program.title,
                            ),
                          ),
                        )
                        .toList(),
              )
            else
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }
}
