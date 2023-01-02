import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/heart_rate_log_model.dart';
import 'package:FitStack/app/models/logs/sleep_asleep_log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:FitStack/app/providers/bloc/user_statistics/user_statistics_bloc.dart';
import 'package:FitStack/features/statistics/ui/widgets/atoms/featured_logs_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeaturedLogList extends StatelessWidget {
  const FeaturedLogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Logs', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.primary)),
          BlocBuilder<UserStatisticsBloc, UserStatisticsState>(
            builder: (context, state) {
              if (state.status != UserStatisticsStatus.loaded) {
                return const Center(child: CircularProgressIndicator());
              }
              final List<ActiveEnergyBurnedLog> activeEnergy = state.userStatistic.activeEnergyBurned ?? [];
              final List<BodyMassIndexLog> bodyMassIndex = state.userStatistic.bodyMassIndexLogs ?? [];
              final List<BodyFatPercentageLog> bodyFatPercentage = state.userStatistic.bodyFatPercentageLogs ?? [];
              final List<WeightLog> weight = state.userStatistic.weightLogs ?? [];
              final List<SleepAsleepLog> sleepAsleep = state.userStatistic.sleepAsleepLogs ?? [];
              final List<StepsLog> steps = state.userStatistic.stepsLogs ?? [];
              final List<HeartRateLog> heartRate = state.userStatistic.heartRateLogs ?? [];
              return ListView(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 20, bottom: AppBar().preferredSize.height + 40),
                children: [
                  if (activeEnergy.isNotEmpty)
                    FeatureLogsTile(
                      date: activeEnergy.isNotEmpty ? activeEnergy.first.createdAt : DateTime.now(),
                      icon: FontAwesomeIcons.fire,
                      subtitle: 'cal',
                      title: 'Active Energy',
                      value: '${activeEnergy.isNotEmpty ? activeEnergy.first.calories.toInt() : 0}',
                      trailingIcon: FontAwesomeIcons.chevronRight,
                    ),
                  if (bodyMassIndex.isNotEmpty)
                    FeatureLogsTile(
                      date: bodyMassIndex.isNotEmpty ? bodyMassIndex.first.createdAt : DateTime.now(),
                      icon: FontAwesomeIcons.person,
                      color: Theme.of(context).colorScheme.secondary,
                      title: 'Body Mass Index',
                      value: '${bodyMassIndex.isNotEmpty ? bodyMassIndex.last.value.toDouble().toStringAsPrecision(3) : 0}',
                      trailingIcon: FontAwesomeIcons.chevronRight,
                    ),
                  if (bodyFatPercentage.isNotEmpty)
                    FeatureLogsTile(
                      date: bodyFatPercentage.isNotEmpty ? bodyFatPercentage.first.createdAt : DateTime.now(),
                      icon: FontAwesomeIcons.person,
                      color: Theme.of(context).colorScheme.secondary,
                      title: 'Body Fat Percentage',
                      value: '${bodyFatPercentage.isNotEmpty ? bodyFatPercentage.last.value.toDouble() : 0}',
                      trailingIcon: FontAwesomeIcons.chevronRight,
                    ),
                  if (weight.isNotEmpty)
                    FeatureLogsTile(
                      date: weight.isNotEmpty ? weight.first.createdAt : DateTime.now(),
                      icon: FontAwesomeIcons.weightScale,
                      color: Theme.of(context).colorScheme.secondary,
                      title: 'Weight',
                      value: '${weight.isNotEmpty ? weight.last.valueInPounds?.toStringAsPrecision(4) : 0}',
                      trailingIcon: FontAwesomeIcons.chevronRight,
                    ),
                  if (sleepAsleep.isNotEmpty)
                    FeatureLogsTile(
                      date: sleepAsleep.isNotEmpty ? sleepAsleep.first.createdAt : DateTime.now(),
                      icon: FontAwesomeIcons.bed,
                      color: Theme.of(context).colorScheme.secondary,
                      title: 'Sleep Asleep',
                      value: '${sleepAsleep.isNotEmpty ? sleepAsleep.last.value.toDouble() : 0}',
                      trailingIcon: FontAwesomeIcons.chevronRight,
                    ),
                  if (steps.isNotEmpty)
                    FeatureLogsTile(
                      date: steps.isNotEmpty ? steps.first.createdAt : DateTime.now(),
                      icon: FontAwesomeIcons.shoePrints,
                      color: Theme.of(context).colorScheme.error,
                      title: 'Steps',
                      value: '${steps.isNotEmpty ? steps.last.value.toDouble() : 0}',
                      trailingIcon: FontAwesomeIcons.chevronRight,
                    ),
                  if (heartRate.isNotEmpty)
                    FeatureLogsTile(
                      date: heartRate.isNotEmpty ? heartRate.first.createdAt : DateTime.now(),
                      icon: FontAwesomeIcons.heartPulse,
                      color: Theme.of(context).colorScheme.error,
                      title: 'Heart Rate',
                      value: '${heartRate.isNotEmpty ? heartRate.last.value.toDouble() : 0}',
                      trailingIcon: FontAwesomeIcons.chevronRight,
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
