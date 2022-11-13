import 'dart:async';
import 'dart:developer';

import 'package:FitStack/app/models/workout/workout_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class WorkoutRepository {
  static String mainUrl = kDebugMode ? "http://localhost:8080" : "https://dev.fitstack.io";
  final Dio dio = Dio();
  final workoutStreamController = StreamController<List<Workout>>.broadcast();

  WorkoutRepository() : super() {
    init();
  }

  Future<void> init() async {
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();

    Response response = await dio.get(
      mainUrl + '/workout/get',
      options: Options(
        headers: {
          "Authorization": "Bearer ${token}",
        },
      ),
    );

    if (response.statusCode == 200) {
      var data = response.data as List;
      workoutStreamController.add(data.map((e) => Workout.fromJson(e)).toList());
    } else {
      log("${response.statusCode}: ${response.statusMessage}");
    }
  }

  Stream<List<Workout>> getWorkouts() {
    return workoutStreamController.stream;
  }
}
