import 'dart:async';
import 'dart:developer';

import 'package:FitStack/app/helpers/endpoints.dart';
import 'package:FitStack/app/models/workout/workout_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WorkoutRepository {
  final dio = Endpoints();
  final workoutStreamController = StreamController<List<Workout>>.broadcast();
  String? token;

  WorkoutRepository() : super() {
    init();
  }

  Future<void> init() async {
    final token = await FirebaseAuth.instance.currentUser!.getIdToken();

    final Response response = await dio.get(
      '/workout/get',
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data as List;
      workoutStreamController.add(data.map((e) => Workout.fromJson(e)).toList());
    } else {
      log("${response.statusCode}: ${response.statusMessage}");
    }
  }

  Future<void> deleteWorkout({required int id}) async {
    token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final Response response = await dio.post(
      '/workout/delete',
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: {
        "id": id,
      },
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception("${response.statusCode}: ${response.statusMessage}");
    }
  }

  Stream<List<Workout>> getWorkouts() {
    log("subscribing to workouts stream");
    return workoutStreamController.stream;
  }
}
