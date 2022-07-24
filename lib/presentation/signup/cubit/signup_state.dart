part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final int index;
  final XFile? profileImage;
  final String username;
  final String firstLastName;
  final List<HealthDataPoint>? healthData;
  final AppState healthStatus;
  final List<GlobalKey<FormBuilderState>>? formKey;
  final int indexRange;
  final String dob;

  SignupState({
    this.dob = '',
    this.formKey,
    this.healthStatus = AppState.NO_DATA,
    this.profileImage,
    this.firstLastName = "",
    this.index = 0,
    this.indexRange = 0,
    this.username = "",
    this.healthData,
  });

  @override
  List<Object> get props => [
        formKey ?? [],
        index,
        dob,
        username,
        firstLastName,
        profileImage ?? XFile('path'),
        healthData ?? [],
        healthStatus,
        indexRange,
      ];

  SignupState copyWith({
    String? dob,
    int? index,
    String? username,
    String? firstLastName,
    XFile? profileImage,
    List<HealthDataPoint>? healthData,
    int? indexRange,
    List<GlobalKey<FormBuilderState>>? formKey,
  }) {
    return SignupState(
      firstLastName: firstLastName ?? this.firstLastName,
      index: index ?? this.index,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
      healthData: healthData ?? this.healthData,
      indexRange: indexRange ?? this.indexRange,
      formKey: formKey ?? this.formKey,
      dob: dob ?? this.dob,
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
