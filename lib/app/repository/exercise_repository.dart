import 'dart:developer';

import 'package:FitStack/app/helpers/endpoints.dart';
import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';

class ExerciseRepository {
  final dio = Endpoints();
  String? token;

  ExerciseRepository();

  Future<List<Exercise>> getExercises() async {
    try {
      final String userToken = await FirebaseAuth.instance.currentUser!.getIdToken();
      final response = await dio.get(
        "/exercise/",
        options: Options(
          headers: {"Authorization": "Bearer $userToken"},
        ),
      );
      if (response.statusCode == 200) {
        final List responseJson = response.data as List;
        final List<Exercise> exercise = responseJson.map((e) => Exercise.fromJson(e)).toList();
        return exercise;
      } else {
        throw Exception("Failed to load exercises");
      }
    } catch (e) {
      log("Error retrieving list of exercises: $e");
      return [];
    }
  }

  Future<Exercise> getExercise(String id) async {
    try {
      final response = await dio.get("/exercise/$id");
      return Exercise.fromJson(response.data);
    } catch (e) {
      locator<AnalyticsService>().logError(exception: e.toString(), reason: 'error getting exercise');
      return Exercise.empty();
    }
  }

  Future<Exercise> addExercise(Exercise exercise) async {
    try {
      final response = await dio.post("/exercise", data: exercise.toJson());
      return Exercise.fromJson(response.data);
    } catch (e) {
      locator<AnalyticsService>().logError(exception: e.toString(), reason: 'error adding exercise');
      return Exercise.empty();
    }
  }

  Future<void> updateExercise(Exercise exercise) async {
    log("exercise: ${exercise.toJson()}");
    final String token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final response = await dio.post(
      "/exercise/update",
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
      data: exercise.toJson(),
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception("Failed to update exercise: ${response.data}");
    }
  }

  Future<void> deleteExercise(String id) async {
    try {
      await dio.delete("/exercise/$id");
    } catch (e) {
      locator<AnalyticsService>().logError(exception: e.toString(), reason: 'error deleting exercise');
    }
  }

  Future<List<Exercise>> searchExercises(String query) async {
    try {
      final response = await dio.get("/exercise/search/$query");
      return (response.data as List).map((e) => Exercise.fromJson(e)).toList();
    } catch (e) {
      locator<AnalyticsService>().logError(exception: e.toString(), reason: 'error searching exercises');
      return [];
    }
  }
}
