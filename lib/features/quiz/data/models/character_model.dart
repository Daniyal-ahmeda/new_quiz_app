import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/character.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Character {
  const CharacterModel({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    Map<String, int> stats = const {},
    List<String> skills = const [],
  }) : super(
         id: id,
         name: name,
         description: description,
         imageUrl: imageUrl,
         createdAt: createdAt,
         updatedAt: updatedAt,
         stats: stats,
         skills: skills,
       );

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
