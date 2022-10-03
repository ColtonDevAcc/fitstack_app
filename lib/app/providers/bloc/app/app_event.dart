part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AppEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthStream status;

  @override
  List<Object> get props => [status];
}

class AuthenticationLogoutRequested extends AppEvent {}
