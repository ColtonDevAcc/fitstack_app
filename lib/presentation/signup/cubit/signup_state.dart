part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final int index;
  final String username;
  SignupState({this.index = 0, this.username = ""});

  @override
  List<Object> get props => [index, username];

  SignupState copyWith({int? index, String? username}) {
    return SignupState(
      index: index ?? this.index,
      username: username ?? this.username,
    );
  }
}
