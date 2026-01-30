// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponses _$VideoResponsesFromJson(Map<String, dynamic> json) =>
    VideoResponses(
      id: (json['id'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => VideoResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoResponsesToJson(VideoResponses instance) =>
    <String, dynamic>{'id': instance.id, 'results': instance.results};

VideoResults _$VideoResultsFromJson(Map<String, dynamic> json) => VideoResults(
  iso6391: json['iso6391'] as String?,
  iso31661: json['iso31661'] as String?,
  name: json['name'] as String?,
  key: json['key'] as String?,
  site: json['site'] as String?,
  size: (json['size'] as num?)?.toInt(),
  type: json['type'] as String?,
  official: json['official'] as bool?,
  publishedAt: json['publishedAt'] as String?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$VideoResultsToJson(VideoResults instance) =>
    <String, dynamic>{
      'iso6391': instance.iso6391,
      'iso31661': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'publishedAt': instance.publishedAt,
      'id': instance.id,
    };
