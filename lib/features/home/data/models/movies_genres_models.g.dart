// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_genres_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresMoviesModels _$GenresMoviesModelsFromJson(Map<String, dynamic> json) =>
    GenresMoviesModels(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenresModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresMoviesModelsToJson(GenresMoviesModels instance) =>
    <String, dynamic>{'genres': instance.genres};

GenresModels _$GenresModelsFromJson(Map<String, dynamic> json) => GenresModels(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$GenresModelsToJson(GenresModels instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
