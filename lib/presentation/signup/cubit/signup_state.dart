part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final int index;
  final XFile? profileImage;
  final String username;
  final String firstLastName;

  SignupState({
    this.profileImage,
    this.firstLastName = "",
    this.index = 0,
    this.username = "",
  });

  @override
  List<Object> get props => [
        index,
        username,
        firstLastName,
        profileImage ?? XFile('path'),
      ];

  SignupState copyWith({int? index, String? username, String? firstLastName, XFile? profileImage}) {
    return SignupState(
      firstLastName: firstLastName ?? this.firstLastName,
      index: index ?? this.index,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
