part of 'user_statistics_bloc.dart';

class UserStatisticsState extends Equatable {
  final UserStatistic userStatistic;
  final UserStatisticsStatus status;

  const UserStatisticsState({
    required this.userStatistic,
    required this.status,
  });

  @override
  List<Object?> get props => [userStatistic, status];

  UserStatisticsState copyWith({
    UserStatistic? userStatistic,
    UserStatisticsStatus? status,
    double? weightDifference,
    double? bmiDifference,
    double? fatPercentageDifference,
  }) {
    return UserStatisticsState(
      userStatistic: userStatistic ?? this.userStatistic,
      status: status ?? this.status,
    );
  }
}
