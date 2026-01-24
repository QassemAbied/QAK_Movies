


import 'package:json_annotation/json_annotation.dart';
part 'movies_genres_models.g.dart';
@JsonSerializable()
class GenresMoviesModels {
 final List<GenresModels>? genres;

  GenresMoviesModels({this.genres});

  factory GenresMoviesModels.fromJson(Map<String, dynamic> json) =>
      _$GenresMoviesModelsFromJson(json);

  Map<String, dynamic> toJson() => _$GenresMoviesModelsToJson(this);
}
@JsonSerializable()
class GenresModels {
final  int? id;
 final String? name;

  GenresModels({this.id, this.name});

  factory GenresModels.fromJson(Map<String, dynamic> json) =>
      _$GenresModelsFromJson(json);

  Map<String, dynamic> toJson() => _$GenresModelsToJson(this);
}