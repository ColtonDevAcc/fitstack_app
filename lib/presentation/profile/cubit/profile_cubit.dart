import 'dart:developer';
import 'dart:io';

import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository userRepository;
  ProfileCubit({required this.userRepository}) : super(ProfileState(profileUrl: ''));

  void ChangeProfileUrl() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
      var token = await FirebaseAuth.instance.currentUser?.getIdToken();
      var profileUrl = await userRepository.updateProfileAvatar(token: token!, file: File(value!.path));
      emit(state.copyWith(profileUrl: profileUrl));
    }).onError(
      (error, stackTrace) {
        log("${error}");
      },
    );
  }
}
