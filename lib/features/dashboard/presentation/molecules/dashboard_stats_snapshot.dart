import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/providers/bloc/user_statistics/user_statistics_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/organisms/user_statistics_snpashot_list.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class DashboardStatsSnapshotList extends StatelessWidget {
  final bool loading;
  final bool updating;
  final UserStatistic userStatistic;
  const DashboardStatsSnapshotList({Key? key, required this.loading, required this.updating, required this.userStatistic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
          child: Row(
            children: [
              Text(
                "Snapshot",
                textScaleFactor: 1.2,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.read<UserStatisticsBloc>().add(UserStatisticsSnapshotUpdateRequested()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      updating ? "syncing" : "sync",
                      textScaleFactor: 1,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    SpinPerfect(
                      controller: (controller) => updating ? controller.repeat() : controller.stop(),
                      manualTrigger: true,
                      animate: updating,
                      child: updating
                          ? Icon(FontAwesome.rotate, size: 15, color: Theme.of(context).colorScheme.onBackground)
                          : RotatedBox(quarterTurns: 3, child: Icon(FontAwesome.rotate, size: 15, color: Theme.of(context).colorScheme.onBackground)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: UserProgressSnapshotList(loading: loading, updating: updating, userStatistic: userStatistic),
        ),
      ],
    );
  }
}
