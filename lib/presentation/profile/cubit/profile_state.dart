part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final String profileUrl;
  const ProfileState({required this.profileUrl});

  @override
  List<Object> get props => [profileUrl];
}
