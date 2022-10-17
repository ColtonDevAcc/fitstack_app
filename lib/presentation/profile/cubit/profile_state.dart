part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final String profileUrl;
  final String? scaffoldMessageString;
  const ProfileState({this.scaffoldMessageString, required this.profileUrl});

  ProfileState copyWith({String? profileUrl, String? scaffoldMessageString}) {
    return ProfileState(
      profileUrl: profileUrl ?? this.profileUrl,
      scaffoldMessageString: scaffoldMessageString ?? this.scaffoldMessageString,
    );
  }

  @override
  List<Object?> get props => [profileUrl, scaffoldMessageString];
}
