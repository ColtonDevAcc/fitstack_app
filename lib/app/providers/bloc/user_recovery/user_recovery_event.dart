part of 'user_recovery_bloc.dart';

abstract class UserRecoveryEvent extends Equatable {
  const UserRecoveryEvent();

  @override
  List<Object> get props => [];
}

class UserRecoveryRequested extends UserRecoveryEvent {}

class UserRecoveryRefreshRequested extends UserRecoveryEvent {}

class UserRecoveryReset extends UserRecoveryEvent {}

class UserRecoveryUpdate extends UserRecoveryEvent {
  final Recovery userRecovery;

  const UserRecoveryUpdate({required this.userRecovery});

  @override
  List<Object> get props => [userRecovery];
}
