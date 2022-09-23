import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository authenticationRepository;

  LoginCubit({required this.authenticationRepository}) : super(LoginState());

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

      emit(state.copyWith(step: AuthStep.Authorized));
    } catch (e) {
      state.errorMessage;

      emit(state.copyWith(step: AuthStep.Error));

      return null;
    }
  }
}
