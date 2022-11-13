part of 'user_statistic_cubit.dart';

class UserStatisticState extends Equatable {
  final UserStatistic userStatistic;
  final UserStatisticsStatus status;
  final double? weightDifference;
  final double? bmiDifference;
  final double? fatPercentageDifference;
  const UserStatisticState({
    this.weightDifference,
    this.bmiDifference,
    this.fatPercentageDifference,
    required this.userStatistic,
    required this.status,
  });

  @override
  List<Object?> get props => [userStatistic, status, weightDifference, bmiDifference, fatPercentageDifference];

  UserStatisticState copyWith({
    UserStatistic? userStatistic,
    UserStatisticsStatus? status,
    double? weightDifference,
    double? bmiDifference,
    double? fatPercentageDifference,
  }) {
    return UserStatisticState(
      userStatistic: userStatistic ?? this.userStatistic,
      status: status ?? this.status,
      weightDifference: weightDifference ?? this.weightDifference,
      bmiDifference: bmiDifference ?? this.bmiDifference,
      fatPercentageDifference: fatPercentageDifference ?? this.fatPercentageDifference,
    );
  }
}

enum UserStatisticsStatus { initial, loading, loaded, error }
