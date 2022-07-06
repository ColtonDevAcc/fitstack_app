part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = "",
    this.password = "",
    this.errorMessage,
  });

  final String email;
  final String password;
  final String? errorMessage;

  @override
  List<Object> get props => [email, password];

  LoginState copyWith({
    String? email,
    String? password,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
