import 'dart:developer';

import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:health/health.dart';
import 'package:image_picker/image_picker.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required AuthenticationRepository authenticationRepository})
      : super(
          SignupState(),
        );

  void changePage(int newIndex) {
    emit(
      state.copyWith(index: newIndex),
    );
  }

  void usernameChanged(String username) {
    if (username.length > 3) {
      state.formKey![state.index].currentState!.validate();
    }
    emit(
      state.copyWith(username: username),
    );
  }

  void firstLastNameChanged(String firstLast) {
    emit(
      state.copyWith(firstLastName: firstLast),
    );
  }

  void changeProfileImage() async {
    XFile? image;
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(
      state.copyWith(profileImage: image),
    );
  }

  void healthDataChanged() async {
    HealthFactory health = HealthFactory();
    List<HealthDataPoint> healthDataList = [];
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 1));

    final types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.BODY_FAT_PERCENTAGE,
      HealthDataType.BODY_MASS_INDEX,
      HealthDataType.HEART_RATE,
      HealthDataType.HEIGHT,
      HealthDataType.WEIGHT,
      //!sleep
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.SLEEP_AWAKE,

      HealthDataType.WATER,
      HealthDataType.WORKOUT,
      HealthDataType.SLEEP_IN_BED,
    ];

    final permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
    ];

    // The location permission is requested for Workouts using the Distance information.
    // await Permission.activityRecognition.request();
    // await Permission.location.request();

    bool requested = await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      try {
        log("we have permissions");
        // fetch health data
        List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(yesterday, now, types);
        // save all the new data points (only the first 100)
        healthDataList.addAll((healthData.length < 100) ? healthData : healthData.sublist(0, 100));

        healthDataList = HealthFactory.removeDuplicates(healthDataList);

        emit(
          state.copyWith(healthData: healthDataList),
        );
      } catch (error) {
        log("Exception in getHealthDataFromTypes: $error");
      }
    } else {
      log("no permissions given");
    }
  }

  void setIndexRange(int range) {
    List<GlobalKey<FormBuilderState>> formKey = [];
    for (int i = 0; i < range; i++) {
      formKey.add(GlobalKey<FormBuilderState>());
    }
    emit(state.copyWith(indexRange: range, formKey: formKey));
  }
}
