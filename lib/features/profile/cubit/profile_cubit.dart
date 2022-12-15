import 'dart:developer';
import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/models/user/user_profile_model.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository userRepository;
  final User? user;
  ProfileCubit({required this.user, required this.userRepository})
      : super(
          ProfileState(
            avatar: user?.profile.avatar ?? "",
            userProfile: user?.profile ?? UserProfile.empty(),
          ),
        );

  Future<void> changeProfileUrl() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
      final token = await fb.FirebaseAuth.instance.currentUser?.getIdToken();
      final profileUrl = await userRepository.updateProfileAvatar(token: token!, file: XFile(value!.path));
      emit(
        state.copyWith(
          userProfile: state.userProfile.copyWith(avatar: profileUrl),
          scaffoldMessageString: "Changed user avatar image",
        ),
      );
    }).onError(
      (error, stackTrace) {
        log("$error");
        emit(state.copyWith(scaffoldMessageString: error.toString()));
      },
    );
  }

  Future<void> getUserProfile() async {
    try {
      if (kDebugMode) log("getting user profile");
      final token = await fb.FirebaseAuth.instance.currentUser?.getIdToken();
      final userProfile = await userRepository.getUserProfile(token: token!);
      log(userProfile.displayName);
      emit(state.copyWith(userProfile: userProfile));
    } catch (e) {
      log("$e");
    }
  }
}
