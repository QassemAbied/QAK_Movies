// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_watch_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWatchListResponse _$AddWatchListResponseFromJson(
  Map<String, dynamic> json,
) => AddWatchListResponse(
  (json['status_code'] as num?)?.toInt(),
  json['status_message'] as String?,
);

Map<String, dynamic> _$AddWatchListResponseToJson(
  AddWatchListResponse instance,
) => <String, dynamic>{
  'status_code': instance.statusCode,
  'status_message': instance.statusMessage,
};
