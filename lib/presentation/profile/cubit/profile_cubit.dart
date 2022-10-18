import 'dart:developer';
import 'dart:io';

import 'package:FitStack/app/models/user_profile_model.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository userRepository;
  ProfileCubit({required this.userRepository}) : super(ProfileState(avatar: '', userProfile: UserProfile.empty()));

  void changeProfileUrl() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
      var token = await FirebaseAuth.instance.currentUser?.getIdToken();
      var profileUrl = await userRepository.updateProfileAvatar(token: token!, file: File(value!.path));
      emit(
        state.copyWith(
          userProfile: state.userProfile.copyWith(avatar: profileUrl),
          scaffoldMessageString: "Changed user avatar image",
        ),
      );
    }).onError(
      (error, stackTrace) {
        log("${error}");
        emit(state.copyWith(scaffoldMessageString: error.toString()));
      },
    );
  }

  Future<void> getUserProfile() async {
    try {
      if (kDebugMode) log("getting user profile");
      var token = await FirebaseAuth.instance.currentUser?.getIdToken();
      log(" =============== $token ========== ");
      var userProfile = await userRepository.getUserProfile(token: token!);
      log("${userProfile.display_name}");
      emit(state.copyWith(userProfile: userProfile));
    } catch (e) {
      log("$e");
    }
  }
}
