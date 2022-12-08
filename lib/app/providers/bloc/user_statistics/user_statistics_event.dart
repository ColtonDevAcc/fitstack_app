part of 'user_statistics_bloc.dart';

abstract class UserStatisticsEvent extends Equatable {
  const UserStatisticsEvent();

  @override
  List<Object> get props => [];
}

class UserStatisticsRequested extends UserStatisticsEvent {}

class UserStatisticsUpdated extends UserStatisticsEvent {
  final UserStatistic userStatistic;

  const UserStatisticsUpdated(this.userStatistic);

  @override
  List<Object> get props => [userStatistic];

  @override
  String toString() => 'UserStatisticsUpdated { userStatistic: $userStatistic }';
}

class UserStatisticsSnapshotUpdateRequested extends UserStatisticsEvent {}
