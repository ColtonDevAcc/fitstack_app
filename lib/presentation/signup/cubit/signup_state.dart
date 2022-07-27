part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final int index;
  final String? profileImage;
  final String username;
  final String firstLastName;
  final List<HealthDataPoint>? healthData;
  final HealthFetchState healthStatus;
  final List<GlobalKey<FormBuilderState>>? formKey;
  final int indexRange;
  final DateTime? dob;
  final int heightFt;
  final int heightInch;
  final double weight;
  final String email;
  final AuthState authState;
  final AssignedSex assignedSex;
  final String password;
  final User? user;

  SignupState({
    this.authState = AuthState.UNAUTHORIZED,
    this.user = null,
    this.password = "",
    this.email = "",
    this.assignedSex = AssignedSex.Unknown,
    this.heightInch = 0,
    this.heightFt = 0,
    this.weight = 0,
    this.dob,
    this.formKey,
    this.healthStatus = HealthFetchState.NO_DATA,
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
        authState,
        user ?? User,
        email,
        formKey ?? [],
        heightInch,
        assignedSex,
        heightFt,
        weight,
        index,
        dob ?? DateTime.now(),
        username,
        firstLastName,
        profileImage ?? File,
        healthData ?? [],
        healthStatus,
        indexRange,
      ];

  SignupState copyWith({
    User? user,
    AuthState? authState,
    String? password,
    String? email,
    int? heightInch,
    double? weight,
    int? heightFt,
    DateTime? dob,
    AssignedSex? assignedSex,
    int? index,
    String? username,
    String? firstLastName,
    String? profileImage,
    List<HealthDataPoint>? healthData,
    int? indexRange,
    List<GlobalKey<FormBuilderState>>? formKey,
  }) {
    return SignupState(
      user: user ?? this.user,
      password: password ?? this.password,
      email: email ?? this.email,
      heightInch: heightInch ?? this.heightInch,
      weight: weight ?? this.weight,
      heightFt: heightFt ?? this.heightFt,
      assignedSex: assignedSex ?? this.assignedSex,
      firstLastName: firstLastName ?? this.firstLastName,
      index: index ?? this.index,
      username: username ?? this.username,
      authState: authState ?? this.authState,
      profileImage: profileImage ?? this.profileImage,
      healthData: healthData ?? this.healthData,
      indexRange: indexRange ?? this.indexRange,
      formKey: formKey ?? this.formKey,
      dob: dob ?? this.dob,
    );
  }
}

enum HealthFetchState {
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

enum AuthState {
  AUTHORIZED,
  UNAUTHORIZED,
  AUTHORIZING,
  ERROR,
}
