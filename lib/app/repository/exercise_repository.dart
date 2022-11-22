import 'dart:developer';

import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class ExerciseRepository {
  final Dio dio = Dio();
  static String mainUrl = kDebugMode ? "http://localhost:8080" : "https://dev.fitstack.io";
  String? token;

  ExerciseRepository();

  Future<List<Exercise>> getExercises() async {
    try {
      final String userToken = await FirebaseAuth.instance.currentUser!.getIdToken();
      final response = await dio.get(
        "$mainUrl/exercise/",
        options: Options(
          headers: {"Authorization": "Bearer ${userToken}"},
        ),
      );
      if (response.statusCode == 200) {
        List responseJson = response.data as List;
        List<Exercise> exercise = responseJson.map((e) => Exercise.fromJson(e)).toList();
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
      final response = await dio.get("$mainUrl/exercise/$id");
      return Exercise.fromJson(response.data);
    } catch (e) {
      print(e);
      return Exercise.empty();
    }
  }

  Future<Exercise> addExercise(Exercise exercise) async {
    try {
      final response = await dio.post("$mainUrl/exercise", data: exercise.toJson());
      return Exercise.fromJson(response.data);
    } catch (e) {
      print(e);
      return Exercise.empty();
    }
  }

  Future<Exercise> updateExercise(Exercise exercise) async {
    try {
      final response = await dio.put("$mainUrl/exercise/${exercise.id}", data: exercise.toJson());
      return Exercise.fromJson(response.data);
    } catch (e) {
      print(e);
      return Exercise.empty();
    }
  }

  Future<void> deleteExercise(String id) async {
    try {
      await dio.delete("$mainUrl/exercise/$id");
    } catch (e) {
      print(e);
    }
  }

  Future<List<Exercise>> searchExercises(String query) async {
    try {
      final response = await dio.get("$mainUrl/exercise/search/$query");
      return (response.data as List).map((e) => Exercise.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
