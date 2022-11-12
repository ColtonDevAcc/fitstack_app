part of 'user_statistic_cubit.dart';

class UserStatisticState extends Equatable {
  final UserStatistic userStatistic;
  final UserStatisticsStatus status;
  const UserStatisticState({required this.userStatistic, required this.status});

  @override
  List<Object> get props => [userStatistic, status];

  UserStatisticState copyWith({UserStatistic? userStatistic, UserStatisticsStatus? status}) {
    return UserStatisticState(
      userStatistic: userStatistic ?? this.userStatistic,
      status: status ?? this.status,
    );
  }
}

enum UserStatisticsStatus { initial, loading, loaded, error }
