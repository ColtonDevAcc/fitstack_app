part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final String avatar;
  final String? scaffoldMessageString;
  final UserProfile userProfile;
  const ProfileState({required this.userProfile, this.scaffoldMessageString, required this.avatar});

  ProfileState copyWith({String? profileUrl, String? scaffoldMessageString, UserProfile? userProfile}) {
    return ProfileState(
        avatar: profileUrl ?? avatar,
        scaffoldMessageString: scaffoldMessageString ?? this.scaffoldMessageString,
        userProfile: userProfile ?? this.userProfile,);
  }

  @override
  List<Object?> get props => [avatar, scaffoldMessageString, userProfile];
}
