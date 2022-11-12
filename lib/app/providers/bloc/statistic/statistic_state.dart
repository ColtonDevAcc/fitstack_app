part of 'statistic_bloc.dart';

class StatisticState extends Equatable {
  final UserStatistic userStatistic;
  final StatisticsState statisticsState;
  const StatisticState({required this.statisticsState, required this.userStatistic});

  @override
  List<Object> get props => [userStatistic];

  StatisticState copyWith({UserStatistic? userStatistic, StatisticsState? statisticsState}) {
    return StatisticState(
      userStatistic: userStatistic ?? this.userStatistic,
      statisticsState: statisticsState ?? this.statisticsState,
    );
  }
}

enum StatisticsState { initial, loading, loaded, error }
