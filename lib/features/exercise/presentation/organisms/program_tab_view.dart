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
    return CustomScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      slivers: [
        BlocBuilder<ProgramCubit, ProgramState>(
          buildWhen: (previous, current) => previous.programs != current.programs,
          builder: (context, state) {
            if (state.programs == null) {
              log('getting programs');
              context.read<ProgramCubit>().getPrograms();
            } else {
              log("${state.programs}");
            }

            return SliverFillRemaining(
              hasScrollBody: false,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: state.programs == null
                    ? []
                    : state.programs!
                        .map(
                          (program) => GestureDetector(
                            onTap: () => context.go('/programs/workout'),
                            child: ProgramCard(
                              description: program.creator?.profile.display_name ?? "Community",
                              title: program.title,
                            ),
                          ),
                        )
                        .toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
