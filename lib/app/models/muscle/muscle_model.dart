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
  //! GENERAL
  inner_outline,
  outline,
  empty,
  //! GENERAL

  //! FRONT VIEW
  sternocleidomastoid,
  pectoralis,
  biceps_brachii,
  triceps_brachii,
  flexor_carpi_ulnaris,
  flexor_carpi_radialis,
  brachioradialis,
  rectus_abdominis,
  rectus_femoris,
  vastus_lateralis,
  vastus_medialis,
  gastrocnemius,
  fibularis_longus,
  //! FRONT VIEW

  //! BOTH SIDES
  external_oblique,
  gluteus_medius,
  trapezius,
  deltoid,
  //! BOTH SIDES

  //! BACK VIEW
  latissimus_dorsi,
  infraspinatus,
  gluteus_maximus,
  biceps_femoris,
  semitendinosus,
  gastrocnemius_soleus,

  //! BACK VIEW
}
