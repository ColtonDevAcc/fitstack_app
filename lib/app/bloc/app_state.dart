part of 'app_bloc.dart';

class AppState extends Equatable {
  final AuthenticationStatus status;
  final fs.User? user;
  const AppState._({this.status = AuthenticationStatus.unknown, this.user});

  const AppState.unknown() : this._();
  const AppState.authenticated(fs.User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user ?? fs.User.empty()];
}
