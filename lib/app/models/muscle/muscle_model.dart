import 'dart:ui';

import 'package:equatable/equatable.dart';

class Muscle extends Equatable {
  final PrimaryMuscleGroups type;
  final String name;
  final String? image;
  final Path? svgPath;
  const Muscle({
    this.svgPath,
    required this.type,
    required this.name,
    this.image,
  });

  @override
  List<Object?> get props => [type, name, image, svgPath];

  Muscle copyWith({
    PrimaryMuscleGroups? type,
    String? name,
    String? image,
    Path? svgPath,
  }) {
    return Muscle(
      type: type ?? this.type,
      name: name ?? this.name,
      image: image ?? this.image,
      svgPath: svgPath ?? this.svgPath,
    );
  }
}

enum PrimaryMuscleGroups {
  //Primary Muscle Groups
  empty,
  vastusLateralist,
  brachioradialis,
  hand,
  abdominals, //The muscles that make up the front of your mid-section.
  biceps, //The muscles located on the front of your arm between your shoulder and elbow.
  calves, //The muscles that make up the lower portion of the back of your leg below your knee.
  deltoids, //The muscles that make up a large portion of the curve of your shoulder.
  forearms, //The muscles located on the lower arm between the elbow and wrist.
  gluteals, //The muscles of your posterior.
  hamstrings, //The muscles located on the back of your leg between your gluteals and knee.
  latissimusDorsi, //The muscles located on the sides of your upper back under the arm pit.
  pectorals, //The muscles of your chest.
  obliques, //The muscles on the sides of your mid-section.
  quadriceps, //The muscles located on the front of your leg between your hip and knee.
  trapezius, //The muscles located on the sides of your neck.
  triceps, //The muscles located on the back of your arm between your shoulder and elbow.
}
