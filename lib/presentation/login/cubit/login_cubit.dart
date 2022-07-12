import 'package:FitStack/app/models/user_model.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(LoginState());

  final AuthenticationRepository _authenticationRepository;

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

  Future<User?> logInWithCredentials() async {
    try {
      emit(state.copyWith(step: AuthStep.Loading));

      User? user = await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      emit(state.copyWith(step: AuthStep.Authorized));

      return user;
    } catch (e) {
      state.errorMessage;

      emit(state.copyWith(step: AuthStep.Error));

      return null;
    }
  }

// //TODO: Login with google
//   Future<void> logInWithGoogle() async {
//     emit(
//       state.copyWith(),
//     );
//     try {
//       await _authenticationRepository.logInWithGoogle();
//       emit(
//         state.copyWith(),
//       );
//     } on LogInWithGoogleFailure catch (e) {
//       emit(
//         state.copyWith(
//           errorMessage: e.message,
//         ),
//       );
//     } catch (_) {
//       emit(state.copyWith());
//     }
//   }

}
