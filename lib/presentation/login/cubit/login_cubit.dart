import 'package:FitStack/app/models/user_model.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

      User user = await authenticationRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      if (user == User.empty()) {
        emit(state.copyWith(step: AuthStep.Authorized));
      } else {
        emit(state.copyWith(step: AuthStep.Error));
      }
    } catch (e) {
      state.errorMessage;

      emit(state.copyWith(step: AuthStep.Error));

      return null;
    }
  }
}
