part of 'login_cubit.dart';

enum AuthStep {
  loading,
  uninitialized,
  authorized,
  error,
}

class LoginState extends Equatable {
  const LoginState({this.email = "", this.password = "", this.errorMessage, this.step = AuthStep.uninitialized});

  final String email;
  final String password;
  final String? errorMessage;
  final AuthStep step;

  LoginState copyWith({
    String? email,
    String? password,
    String? errorMessage,
    AuthStep? step,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      step: step ?? this.step,
    );
  }

  @override
  List<Object> get props => [email, password, step];
}
