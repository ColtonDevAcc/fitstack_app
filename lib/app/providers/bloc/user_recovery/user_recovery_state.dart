part of 'user_recovery_bloc.dart';

class UserRecoveryState extends Equatable {
  final Recovery userRecovery;
  final List<Muscle> minorMuscles;
  final List<Muscle> frontMuscleList;
  final UserRecoveryStatus status;
  const UserRecoveryState({required this.minorMuscles, required this.frontMuscleList, required this.status, required this.userRecovery});

  @override
  List<Object> get props => [userRecovery, status, minorMuscles, frontMuscleList];

  UserRecoveryState copyWith({
    Recovery? userRecovery,
    UserRecoveryStatus? status,
    List<Muscle>? minorMuscles,
    List<Muscle>? frontMuscleList,
  }) {
    return UserRecoveryState(
      userRecovery: userRecovery ?? this.userRecovery,
      status: status ?? this.status,
      minorMuscles: minorMuscles ?? this.minorMuscles,
      frontMuscleList: frontMuscleList ?? this.frontMuscleList,
    );
  }
}

enum UserRecoveryStatus { initial, loading, success, failure }
