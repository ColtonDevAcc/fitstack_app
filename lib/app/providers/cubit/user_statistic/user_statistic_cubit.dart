import 'dart:math';

import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health/health.dart';

part 'user_statistic_state.dart';

class UserStatisticCubit extends Cubit<UserStatisticState> {
  final UserRepository userRepository;
  UserStatisticCubit({required this.userRepository})
      : super(
          UserStatisticState(status: UserStatisticsStatus.initial, userStatistic: UserStatistic.empty()),
        );

  Future<void> getUserStatistic() async {
    emit(UserStatisticState(status: UserStatisticsStatus.loading, userStatistic: UserStatistic.empty()));
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();

      final userStatistic = await userRepository.getStatistics(token: token);
      emit(UserStatisticState(status: UserStatisticsStatus.loaded, userStatistic: userStatistic));

      checkUserStatistic();
    } catch (e) {
      emit(UserStatisticState(status: UserStatisticsStatus.error, userStatistic: UserStatistic.empty()));
    }
  }

  double getWeightDifference() {
    if (state.userStatistic.weight_log != []) {
      var weightMax = state.userStatistic.weight_log?.first.weight ?? 0;
      var weightMin = state.userStatistic.weight_log?.last.weight ?? 0;
      return weightMax - weightMin;
    }
    return 0;
  }

  double getBMIRangeDifference() {
    if (state.userStatistic.bmi_log != []) {
      //get log created first and log created last the get the difference
      var bmiMax = state.userStatistic.bmi_log?.first.bmi ?? 0;
      var bmiMin = state.userStatistic.bmi_log?.last.bmi ?? 0;

      return bmiMax - bmiMin;
    }
    return 0;
  }

  double getFatPercentageDifference() {
    if (state.userStatistic.body_fat_log != null || state.userStatistic.body_fat_log != []) {
      var fatPercentageMax = state.userStatistic.body_fat_log?.first.body_fat ?? 0;
      var fatPercentageMin = state.userStatistic.body_fat_log?.last.body_fat ?? 0;
      return fatPercentageMax - fatPercentageMin;
    }
    return 0;
  }

  Future<void> checkUserStatistic() async {
    HealthFactory health = HealthFactory();
    var today = DateTime.now();
    var types = [
      HealthDataType.BODY_FAT_PERCENTAGE,
      HealthDataType.BODY_MASS_INDEX,
      HealthDataType.WEIGHT,
    ];
    //check if last update is today

    if (today.difference(state.userStatistic.updated_at!).inDays > 0) {
      var lastFetch = state.userStatistic.updated_at;
      var healthData = await health.getHealthDataFromTypes(
        lastFetch ?? today.subtract(Duration(days: 365)),
        DateTime.now(),
        types,
      );

      // update the data
      var token = await FirebaseAuth.instance.currentUser!.getIdToken();
      List<WeightLog> userWeightLogs = [];
      List<BMILog> userBmiLogs = [];
      List<BodyFatLog> userBodyFatLogs = [];

      healthData.forEach((element) {
        var value = double.parse((element.value).toString());
        if (element.type == HealthDataType.WEIGHT) {
          var weight = WeightLog.empty().fromKgToLbs(weight: value);
          userWeightLogs.add(
            WeightLog(weight: weight, updated_at: DateTime.now().toUtc(), created_at: DateTime.now().toUtc(), id: null, user_statistic_id: ''),
          );
        } else if (element.type == HealthDataType.BODY_MASS_INDEX) {
          print(element);
          userBmiLogs.add(
            BMILog(bmi: value, updated_at: DateTime.now().toUtc(), created_at: DateTime.now().toUtc(), id: null, user_statistic_id: ''),
          );
        } else if (element.type == HealthDataType.BODY_FAT_PERCENTAGE) {
          userBodyFatLogs.add(
            BodyFatLog(body_fat: value, updated_at: DateTime.now().toUtc(), created_at: DateTime.now().toUtc(), id: null, user_statistic_id: ''),
          );
        }
      });

      await userRepository.updateStatistics(
          statistic: UserStatistic(
            weight_log: userWeightLogs,
            bmi_log: userBmiLogs,
            body_fat_log: userBodyFatLogs,
            updated_at: DateTime.now().toUtc(),
          ),
          token: token);

      userWeightLogs.addAll(state.userStatistic.weight_log ?? []);
      userBmiLogs.addAll(state.userStatistic.bmi_log ?? []);
      userBodyFatLogs.addAll(state.userStatistic.body_fat_log ?? []);

      emit(
        state.copyWith(
            userStatistic: state.userStatistic.copyWith(
          bmi_log: userBmiLogs,
          weight_log: userWeightLogs,
          body_fat_log: userBodyFatLogs,
          updated_at: DateTime.now().toUtc(),
        )),
      );
    } else {
      print("No data fetched");
    }
  }
}
