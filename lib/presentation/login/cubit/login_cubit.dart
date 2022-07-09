import 'dart:developer';

import 'package:FitStack/app/models/user_model.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

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
    if (kDebugMode) log("email: ${state.email} password: ${state.password}");
    User? user = await _authenticationRepository.logInWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );
    if (kDebugMode) log("${user}");
    return user;

    return null;
  }

//TODO: Login with google
  Future<void> logInWithGoogle() async {
    emit(
      state.copyWith(),
    );
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(
        state.copyWith(),
      );
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
        ),
      );
    } catch (_) {
      emit(state.copyWith());
    }
  }
}
