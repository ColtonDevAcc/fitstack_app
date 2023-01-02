import 'dart:developer';
import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/services/muscle_service.dart';

class MuscleRepository {
  Future<List<Muscle>> parseMuscleList({required bool front}) async {
    final String generalString = front ? "assets/muscles/model/muscular_front.svg" : "assets/muscles/model/muscular_back.svg";
    final result = await MuscleService().svgToMuscles(generalString);
    log("$result");
    return result;
  }
}
