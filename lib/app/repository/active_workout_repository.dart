import 'dart:async';
import 'dart:developer';
import 'package:FitStack/app/helpers/endpoints.dart';
import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:dio/dio.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ActiveWorkoutRepository {
  final controller = StreamController<AuthStream>.broadcast();
  final dio = Endpoints();
  String? token;
  ActiveWorkoutRepository();

  Future<List<Exercise>> fetchExercises() async {
    try {
      var token = await FirebaseAuth.instance.currentUser!.getIdToken();

      final Response response = await dio.get(
        '/workout/exercises',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        List responseJson = response.data as List;
        List<Exercise> exercise = responseJson.map((e) => Exercise.fromJson(e)).toList();
        return exercise;
      } else {
        throw Exception('Failed to load exercises');
      }
    } catch (e) {
      log("$e");
    }
    return [];
  }
}
