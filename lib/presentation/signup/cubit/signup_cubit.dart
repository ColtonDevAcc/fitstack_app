import 'dart:developer';
import 'dart:io';

import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  void usernameChanged(String username) {
    List<GlobalKey<FormBuilderState>>? formKeyList = state.formKey;
    if (username.length > 3) {
      formKeyList?[state.index].currentState!.validate();
    } else {
      formKeyList?[state.index]
          .currentState!
          .invalidateFirstField(errorText: 'Must be more than 3 characters');
    }
    log("form key validation: ${formKeyList?[state.index].currentState!.isValid}");
    emit(
      state.copyWith(username: username, formKey: formKeyList),
    );
  }

  void firstLastNameChanged(String firstLast) {
    List<GlobalKey<FormBuilderState>>? formKeyList = state.formKey;
    if (firstLast.length > 5 && firstLast.contains(" ")) {
      formKeyList?[state.index].currentState!.validate();
    } else {
      formKeyList?[state.index]
          .currentState!
          .invalidateFirstField(errorText: 'Must be more than 5 characters and contain a space');
    }
    emit(
      state.copyWith(firstLastName: firstLast, formKey: formKeyList),
    );
  }

  void changeProfileImage(BuildContext context) async {
    try {
      UploadTask? uploadTask;

      await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child('uploads/${value?.path}');
        uploadTask = firebaseStorageRef.putFile(File(value!.path));
      }).onError(
        (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${error}")));
        },
      );

      String? url = await uploadTask?.then((p0) => p0.ref.getDownloadURL());

      emit(
        state.copyWith(profileImage: url),
      );

      state.user?.updatePhotoURL(url);
    } catch (e) {
      log("$e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        content: Text("${e}"),
      ));
    }
  }

  void healthDataChanged(List<HealthDataType>? healthDataTypeList) async {
    HealthFactory health = HealthFactory();
    List<HealthDataPoint> healthDataList = [];
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 30));

    final types = healthDataTypeList ??
        [
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

    List<HealthDataAccess> permissions = [];
    types.forEach((element) {
      permissions.add(HealthDataAccess.READ_WRITE);
    });

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

        HealthDataPoint? healthDataWeight =
            healthDataList.firstWhere((element) => element.type == HealthDataType.WEIGHT);
        HealthDataPoint? healthDataHeight =
            healthDataList.firstWhere((element) => element.type == HealthDataType.HEIGHT);

        var height = double.tryParse(healthDataHeight.value.toString())! * 39.37007874;
        var heightFt = (height / 12).floor();
        var heightInch = (height % 12).round();
        var weight =
            (double.tryParse(healthDataWeight.value.toString())! * 2.20462262185).roundToDouble();

        GlobalKey<FormBuilderState> formKey = state.formKey![state.index];
        if (formKey.currentState!.fields.containsKey('ft')) {
          formKey.currentState?.fields['ft']?.reset();
          formKey.currentState?.fields['in']?.reset();
          formKey.currentState?.fields['lb']?.reset();

          formKey.currentState?.fields['ft']?.didChange("$heightFt");
          formKey.currentState?.fields['in']?.didChange("$heightInch");
          formKey.currentState?.fields['lb']?.didChange("$weight");
        }

        emit(
          state.copyWith(
            healthData: healthDataList,
            weight: weight,
            heightFt: heightFt,
            heightInch: heightInch,
          ),
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
    for (int i = 0; i <= range; i++) {
      formKey.add(GlobalKey<FormBuilderState>());
    }
    emit(state.copyWith(indexRange: range, formKey: formKey));
  }

  void dateOfBirthChanged(DateTime? dob) {
    emit(state.copyWith(dob: dob));
  }

  void weightChanged(double? weight) {
    emit(state.copyWith(weight: weight));
  }

  void heightFtChanged(int? heightFt) {
    emit(state.copyWith(heightFt: heightFt));
  }

  void heightInchChanged(int? heightInch) {
    emit(state.copyWith(heightInch: heightInch));
  }

  void assignedSexChanged(AssignedSex assignedSex) {
    emit(state.copyWith(assignedSex: assignedSex));
  }

  void passwordChanged(String? password) {
    emit(state.copyWith(password: password));
  }

  void emailChanged(String? email) {
    emit(state.copyWith(email: email));
  }

  void userSignUp() {
    Future<UserCredential> userCred = FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: state.email, password: state.password);

    userCred.then((value) {
      User? _user = value.user;
      _user?.updateDisplayName(state.username);
      _user?.updatePhotoURL(state.profileImage);
    });
  }

  void formKeyChanged(GlobalKey<FormBuilderState> formKey) {
    List<GlobalKey<FormBuilderState>> newFormKeyList = state.formKey!;
    newFormKeyList.replaceRange(state.index, state.index, [formKey]);

    emit(state.copyWith(formKey: newFormKeyList));
  }

  void nextPage(BuildContext context) {
    bool isValid = state.formKey![state.index].currentState!.isValid;
    if (isValid && state.index != 0) {
      emit(state.copyWith(index: state.index + 1));
    } else if (state.index == 0 && isValid) {
      emit(state.copyWith(authState: AuthState.AUTHORIZING));
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: state.email, password: state.password)
          .then((value) => value.user)
          .then((value) => value == null
              ? null
              : emit(state.copyWith(
                  user: value, index: state.index + 1, authState: AuthState.AUTHORIZED)))
          .onError(
        (error, stackTrace) {
          emit(state.copyWith(authState: AuthState.ERROR));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text("${error.toString().split("]")[1]}"),
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Text(
              "${state.formKey![0].currentState!.fields.entries.where((element) => !element.value.isValid).map((e) => "${e.key}: ${e.value.errorText}")}"),
        ),
      );
    }
  }

  void previousPage() {
    emit(state.copyWith(index: state.index - 1));
  }
}
