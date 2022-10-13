import 'dart:async';
import 'package:FitStack/app/models/user_model.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  late StreamSubscription<AuthStream> authenticationStatusSubscription;

  AppBloc({required this.authenticationRepository, required this.userRepository}) : super(const AppState.unknown()) {
    on<AuthenticationStatusChanged>(onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(onAuthenticationLogoutRequested);
    authenticationStatusSubscription = authenticationRepository.status.listen((status) => add(AuthenticationStatusChanged(status)));
  }

  void onLogoutRequested(AuthenticationLogoutRequested event, Emitter<AppState> emit) {
    authenticationRepository.logOut();
  }

  @override
  Future<void> close() {
    authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> onAuthenticationStatusChanged(AuthenticationStatusChanged event, Emitter<AppState> emit) async {
    switch (event.status.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AppState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final user = event.status.user;
        return emit(
          user != User.empty() ? AppState.authenticated(user) : const AppState.unauthenticated(),
        );
      case AuthenticationStatus.unknown:
        return emit(const AppState.unknown());
    }
  }

  void onAuthenticationLogoutRequested(AuthenticationLogoutRequested event, Emitter<AppState> emit) {
    authenticationRepository.logOut();
  }
}
