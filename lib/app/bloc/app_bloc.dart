import 'dart:async';

import 'package:FitStack/app/models/user_model.dart' as fs;
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_analysis/very_good_analysis.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationRepository authenticationRepository;
  late StreamSubscription<AuthenticationStatus> authenticationStatusSubscription;

  AppBloc({required AuthenticationRepository authenticationRepository})
      : authenticationRepository = authenticationRepository,
        super(const AppState.unknown()) {
    on<AuthenticationStatusChanged>(onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(onAuthenticationLogoutRequested);
    authenticationStatusSubscription = authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  void onLogoutRequested(AuthenticationLogoutRequested event, Emitter<AppState> emit) {
    unawaited(authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> onAuthenticationStatusChanged(AuthenticationStatusChanged event, Emitter<AppState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AppState.unauthenticated());
      case AuthenticationStatus.authenticated:
      // var token = FirebaseAuth.instance.currentUser?.getIdToken();
      // authenticationRepository.
      // return emit(
      //   user != null ? AppState.authenticated(user) : const AppState.unauthenticated(),
      // );
      case AuthenticationStatus.unknown:
        return emit(const AppState.unknown());

      default:
        return null;
    }
  }

  void onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AppState> emit,
  ) {
    authenticationRepository.logOut();
  }
}
