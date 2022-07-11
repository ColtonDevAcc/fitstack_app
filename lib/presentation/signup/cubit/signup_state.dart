part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final int index;
  const SignupState({
    required this.index,
  });

  @override
  List<Object> get props => [index];

  SignupState copyWith({required int index}) {
    return SignupState(index: index);
  }
}
