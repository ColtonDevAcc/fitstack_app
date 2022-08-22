import 'dart:developer';
import 'dart:io';

import 'package:FitStack/app/bloc/app_bloc.dart';
import 'package:FitStack/app/models/user_model.dart' as fs;
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/routing/appRouter.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:health/health.dart';
import 'package:image_picker/image_picker.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AppBloc appBloc;
  SignupCubit({required this.appBloc, required AuthenticationRepository authenticationRepository})
      : super(SignupState());

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
        if (formKey.currentState!.fields.containsKey('heightFt')) {
          formKey.currentState?.fields['heightFt']?.didChange("$heightFt");
          formKey.currentState?.fields['heightInch']?.didChange("$heightInch");
          formKey.currentState?.fields['weight']?.didChange("$weight");
        }

        formKeyChanged(formKey);
        List<GlobalKey<FormBuilderState>> newFormKeyList = state.formKey!;
        newFormKeyList.replaceRange(state.index, state.index, [formKey]);

        emit(state.copyWith(
          healthData: healthDataList,
          weight: weight,
          heightFt: heightFt,
          heightInch: heightInch,
          formKey: newFormKeyList,
        ));
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

  Future<fs.User?> userSignUp() async {
    try {
      Future<UserCredential> userCred = FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: state.email, password: state.password);
      User? user = await userCred.then((value) => value.user);

      var response = await Dio().post(
        kDebugMode ? "https://dev.fitstack.io/user/signup" : "https://api.fitstack.io/user/signup",
        data: fs.User(
          display_name: state.username,
          date_of_birth: state.dob!,
          first_name: state.firstLastName.split(" ")[0],
          last_name: state.firstLastName.split(" ")[1],
          email_verified: false,
          email: state.email,
          user_id: user!.uid,
          phone_number: state.phoneNumber,
        ).toJson(),
      );

      log("//====================== user signup response: $response with status: ${response.statusCode} ======================//");

      return await fs.User.fromJson(response.data);
    } on DioError catch (e) {
      log("error while trying to signup user: ${e.message} - ${e.response}");
      return null;
    }
  }

  void formKeyChanged(GlobalKey<FormBuilderState>? formKey) {
    List<GlobalKey<FormBuilderState>> keyList = state.formKey!;
    keyList.replaceRange(state.index, state.index, [formKey!]);

    if (keyList[state.index].currentState?.value ==
        state.formKey?[state.index].currentState?.value) {
      log("the keys where the same. No change");
    } else
      emit(state.copyWith(formKey: keyList));
  }

  void nextPage(BuildContext context) async {
    bool isValid = state.formKey![state.index].currentState!.isValid;
    if (isValid && state.index + 1 != state.indexRange) {
      emit(state.copyWith(index: state.index + 1));
    } else if (state.indexRange == state.index + 1 && isValid) {
      emit(state.copyWith(authState: AuthState.AUTHORIZING));
      fs.User? user = await userSignUp().onError((error, stackTrace) {
        emit(state.copyWith(errorMessage: "$error"));
        return null;
      });
      if (user != null) {
        // appBloc.mapEventToState(AuthAuthenticated(user: user));

        AutoRouter.of(context).popAndPush(Main_View());
      } else {
        emit(state.copyWith(errorMessage: "unable to create user"));
      }
    } else {
      emit(
        state.copyWith(
          errorMessage:
              "${state.formKey![0].currentState!.fields.entries.where((element) => !element.value.isValid).map((e) => "${e.key}: ${e.value.errorText}")}",
        ),
      );
    }
  }

  void previousPage(BuildContext context) {
    if (state.index == 0) {
      Navigator.pop(context);
    } else {
      emit(state.copyWith(index: state.index - 1));
    }
  }

  void phoneNumberChanged(String? phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }
}
