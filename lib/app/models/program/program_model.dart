import 'package:FitStack/app/models/routine/routine_model.dart';
import 'package:FitStack/app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'program_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class Program extends Equatable {
  final int id;
  final String title;
  final String description;
  final User? creator;
  final Routine? routine;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Program({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
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
  factory Program.empty() => Program(creator: User.empty(), description: '', id: 1, routine: null, title: '');
}

//  ID          uint             `gorm:"primaryKey;autoIncrement" json:"id"`
// 	Title       string           `json:"title"`
// 	Description string           `json:"description"`
// 	CreatorID   string           `json:"creator_id"`
// 	Creator     *user.User       `json:"creator" gorm:"constraint:OnUpdate:CASCADE,OnDelete:SET NULL;"`
// 	Routine     *routine.Routine `json:"routine" gorm:"foreignKey:ID"`
// 	CreatedAt   time.Time        `json:"created_at"`
// 	UpdatedAt   time.Time        `json:"updated_at"`
// 	DeletedAt   gorm.DeletedAt   `gorm:"index"`