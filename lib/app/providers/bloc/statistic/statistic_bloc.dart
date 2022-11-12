import 'dart:math';

import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final UserRepository userRepository;

  StatisticBloc({required this.userRepository})
      : super(
          StatisticState(
            userStatistic: UserStatistic.empty(),
            statisticsState: StatisticsState.initial,
          ),
        ) {
    on<StatisticsLoading>(onStatisticsLoading);
    on<StatisticsLoaded>(onStatisticsLoaded);
    on<LoadStatistics>(onLoadStatistics);
  }

  void onLoadStatistics(LoadStatistics event, Emitter<StatisticState> emit) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    UserStatistic userStatistic = await userRepository.getStatistics(token: token!);
    emit(state.copyWith(userStatistic: userStatistic));
  }

  void onStatisticsLoading(StatisticsLoading event, Emitter<StatisticState> emit) {}

  void onStatisticsLoaded(StatisticsLoaded event, Emitter<StatisticState> emit) {}

  double getWeightRangeDifference() {
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
}
