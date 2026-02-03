// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_watch_list_requst.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWatchListRequest _$AddWatchListRequestFromJson(Map<String, dynamic> json) =>
    AddWatchListRequest(
      json['media_type'] as String,
      (json['media_id'] as num).toInt(),
      json['watchlist'] as bool,
    );

Map<String, dynamic> _$AddWatchListRequestToJson(
  AddWatchListRequest instance,
) => <String, dynamic>{
  'media_type': instance.mediaType,
  'media_id': instance.mediaId,
  'watchlist': instance.watchlist,
};
