import 'package:FitStack/app/models/routine/routine_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'program_model.g.dart';

@JsonSerializable()
@CopyWith()
class Program extends Equatable {
  final String id;
  final String title;
  final String description;
  final String creator;
  final Routine? routine;

  Program({
    required this.id,
    required this.title,
    required this.description,
    required this.creator,
    required this.routine,
  });

  @override
  List<Object?> get props => [];

  factory Program.fromJson(Map<String, dynamic> json) => _$ProgramFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramToJson(this);
  factory Program.empty() => Program(creator: '', description: '', id: '', routine: null, title: '');
}

	// ID          uuid.UUID        `json:"id" db:"id"`
	// Title       string           `json:"title" db:"title"`
	// Description string           `json:"description" db:"description"`
	// Creator     string           `json:"creator" db:"creator"`
	// Routine     *routine.Routine `json:"routine" db:""`