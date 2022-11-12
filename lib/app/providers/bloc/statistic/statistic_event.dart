part of 'statistic_bloc.dart';

class StatisticEvent extends Equatable {
  const StatisticEvent();

  @override
  List<Object> get props => [];
}

class StatisticsLoading extends StatisticEvent {}

class StatisticsLoaded extends StatisticEvent {
  final List<UserStatistic> statistics;

  const StatisticsLoaded([this.statistics = const []]);

  @override
  List<Object> get props => [statistics];

  @override
  String toString() => 'StatisticLoadSuccess { statistics: $statistics }';
}

class LoadStatistics extends StatisticEvent {}

class StatisticsLoadFailure extends StatisticEvent {}
