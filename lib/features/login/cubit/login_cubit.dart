import 'package:FitStack/app/helpers/fitstack_error_toast.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository authenticationRepository;
  LoginCubit({required this.authenticationRepository}) : super(const LoginState());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    try {
      emit(state.copyWith(step: AuthStep.Loading));

      await authenticationRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
    } catch (e) {
      emit(state.copyWith(step: AuthStep.Error, errorMessage: e.toString()));
      FitStackToast.showErrorToast("error logging in $e");
      return;
    }
  }
}
