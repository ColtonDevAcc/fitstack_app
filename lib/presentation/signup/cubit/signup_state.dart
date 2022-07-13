part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final int index;
  final XFile? profileImage;
  final String username;
  final String firstLastName;
  final List<HealthDataPoint>? healthData;
  final AppState healthStatus;

  SignupState({
    this.healthStatus = AppState.NO_DATA,
    this.profileImage,
    this.firstLastName = "",
    this.index = 0,
    this.username = "",
    this.healthData,
  });

  @override
  List<Object> get props => [
        index,
        username,
        firstLastName,
        profileImage ?? XFile('path'),
        healthData ?? [],
        healthStatus,
      ];

  SignupState copyWith({
    int? index,
    String? username,
    String? firstLastName,
    XFile? profileImage,
    List<HealthDataPoint>? healthData,
  }) {
    return SignupState(
      firstLastName: firstLastName ?? this.firstLastName,
      index: index ?? this.index,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
      healthData: healthData ?? this.healthData,
    );
  }
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_NOT_ADDED,
  STEPS_READY,
}
