part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final String profileUrl;
  const ProfileState({required this.profileUrl});

  ProfileState copyWith({String? profileUrl}) {
    return ProfileState(profileUrl: profileUrl ?? this.profileUrl);
  }

  @override
  List<Object> get props => [profileUrl];
}
