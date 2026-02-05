// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavoriteRequest _$AddFavoriteRequestFromJson(Map<String, dynamic> json) =>
    AddFavoriteRequest(
      json['media_type'] as String,
      (json['media_id'] as num).toInt(),
      json['favorite'] as bool,
    );

Map<String, dynamic> _$AddFavoriteRequestToJson(AddFavoriteRequest instance) =>
    <String, dynamic>{
      'media_type': instance.mediaType,
      'media_id': instance.mediaId,
      'favorite': instance.favorite,
    };
