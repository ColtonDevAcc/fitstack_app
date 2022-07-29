part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AppStatus status;
  final User? user;
  AppState._({
    required this.status,
    this.user,
  });

  AppState.authenticated(User user) : this._(status: AppStatus.authenticated, user: user);

  AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object> get props => [status, user ?? User.empty()];
}
