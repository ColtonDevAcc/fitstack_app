part of 'user_statistics_bloc.dart';

class UserStatisticsState extends Equatable {
  final UserStatistic userStatistic;
  final UserStatistic selected;
  final StatisticsSnapshotUpdateStatus snapshotUpdateStatus;
  final UserStatisticsStatus status;

  const UserStatisticsState({
    required this.snapshotUpdateStatus,
    required this.selected,
    required this.userStatistic,
    required this.status,
  });

  @override
  List<Object?> get props => [userStatistic, status, snapshotUpdateStatus, selected];

  UserStatisticsState copyWith({
    UserStatistic? userStatistic,
    UserStatisticsStatus? status,
    UserStatistic? selected,
    StatisticsSnapshotUpdateStatus? snapshotUpdateStatus,
  }) {
    return UserStatisticsState(
      userStatistic: userStatistic ?? this.userStatistic,
      status: status ?? this.status,
      selected: selected ?? this.selected,
      snapshotUpdateStatus: snapshotUpdateStatus ?? this.snapshotUpdateStatus,
    );
  }
}
