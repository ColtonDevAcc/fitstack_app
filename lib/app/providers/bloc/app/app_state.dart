part of 'app_bloc.dart';

class AppState extends Equatable {
  final AuthenticationStatus status;
  final User? user;
  const AppState._({this.status = AuthenticationStatus.unknown, this.user});

  const AppState.unknown() : this._();
  const AppState.authenticated(User user) : this._(status: AuthenticationStatus.authenticated, user: user);
  const AppState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);
  const AppState.authenticating() : this._(status: AuthenticationStatus.authenticating);

  @override
  List<Object> get props => [status, user ?? User.empty()];
}
