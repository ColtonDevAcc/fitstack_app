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
  final int heightFt;
  final double heightInch;
  final double weight;
  final String email;
  final AssignedSex assignedSex;
  final String password;

  SignupState({
    this.password = "",
    this.email = "",
    this.assignedSex = AssignedSex.Unknown,
    this.heightInch = 0,
    this.heightFt = 0,
    this.weight = 0,
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
        password,
        email,
        formKey ?? [],
        heightInch,
        assignedSex,
        heightFt,
        weight,
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
    String? password,
    String? email,
    double? heightInch,
    double? weight,
    int? heightFt,
    String? dob,
    AssignedSex? assignedSex,
    int? index,
    String? username,
    String? firstLastName,
    XFile? profileImage,
    List<HealthDataPoint>? healthData,
    int? indexRange,
    List<GlobalKey<FormBuilderState>>? formKey,
  }) {
    return SignupState(
      password: password ?? this.password,
      email: email ?? this.email,
      heightInch: heightInch ?? this.heightInch,
      weight: weight ?? this.weight,
      heightFt: heightFt ?? this.heightFt,
      assignedSex: assignedSex ?? this.assignedSex,
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

enum AssignedSex { Male, Female, Unknown }
