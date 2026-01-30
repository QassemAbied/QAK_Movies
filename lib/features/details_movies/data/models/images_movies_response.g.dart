// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesMoviesResponse _$ImagesMoviesResponseFromJson(
  Map<String, dynamic> json,
) => ImagesMoviesResponse(
  backdrops: (json['backdrops'] as List<dynamic>?)
      ?.map((e) => Backdrops.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ImagesMoviesResponseToJson(
  ImagesMoviesResponse instance,
) => <String, dynamic>{'backdrops': instance.backdrops};

Backdrops _$BackdropsFromJson(Map<String, dynamic> json) => Backdrops(
  aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toInt(),
  iso6391: json['iso6391'] as String?,
  filePath: json['file_path'] as String?,
  voteAverage: (json['vote_Average'] as num?)?.toDouble(),
  voteCount: (json['vote_Count'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
);

Map<String, dynamic> _$BackdropsToJson(Backdrops instance) => <String, dynamic>{
  'aspect_ratio': instance.aspectRatio,
  'height': instance.height,
  'iso6391': instance.iso6391,
  'file_path': instance.filePath,
  'vote_Average': instance.voteAverage,
  'vote_Count': instance.voteCount,
  'width': instance.width,
};
