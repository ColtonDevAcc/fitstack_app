import 'dart:math';

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
      var weightMax = state.userStatistic.weight_log?.map((e) => e.weight).toList().reduce(max) ?? 0;
      var weightMin = state.userStatistic.weight_log?.map((e) => e.weight).toList().reduce(min) ?? 0;
      return weightMax - weightMin;
    }
    return 0;
  }

  double getBMIRangeDifference() {
    if (state.userStatistic.bmi_log != []) {
      var bmiMax = state.userStatistic.bmi_log?.map((e) => e.bmi).toList().reduce(max) ?? 0;
      var bmiMin = state.userStatistic.bmi_log?.map((e) => e.bmi).toList().reduce(min) ?? 0;
      return bmiMax - bmiMin;
    }
    return 0;
  }

  double getFatPercentageDifference() {
    if (state.userStatistic.body_fat_log != null || state.userStatistic.body_fat_log != []) {
      var fatPercentageMax = state.userStatistic.body_fat_log?.map((e) => e.body_fat).toList().reduce(max) ?? 0;
      var fatPercentageMin = state.userStatistic.body_fat_log?.map((e) => e.body_fat).toList().reduce(min) ?? 0;
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

    if (today.difference(state.userStatistic.weight_log!.last.updated_at).inHours > 0) {
      print("fetching data");
      // see when the last data was fetched
      var lastFetch = state.userStatistic.updated_at;
      // fetch data from the last fetch until now
      var healthData = await health.getHealthDataFromTypes(
        lastFetch,
        DateTime.now(),
        types,
      );
      print("${healthData.length} data points fetched");
    } else {
      print("No data fetched");
    }
  }
}
