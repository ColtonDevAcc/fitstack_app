import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required AuthenticationRepository authenticationRepository})
      : super(
          SignupState(),
        );

  void changePage(int newIndex) {
    emit(
      state.copyWith(index: newIndex),
    );
  }

  void usernameChanged(String username) {
    emit(
      state.copyWith(username: username),
    );
  }

  void firstLastNameChanged(String firstLast) {
    emit(
      state.copyWith(firstLastName: firstLast),
    );
  }
}
