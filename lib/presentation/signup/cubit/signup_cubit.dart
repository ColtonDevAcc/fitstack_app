import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required AuthenticationRepository authenticationRepository})
      : super(const SignupState(index: 0));

  void nextPage(int newIndex) {
    emit(
      state.copyWith(index: newIndex),
    );
  }
}
