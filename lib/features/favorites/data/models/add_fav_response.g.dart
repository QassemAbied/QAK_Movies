// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_fav_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavResponse _$AddFavResponseFromJson(Map<String, dynamic> json) =>
    AddFavResponse(
      (json['status_code'] as num?)?.toInt(),
      json['status_message'] as String?,
    );

Map<String, dynamic> _$AddFavResponseToJson(AddFavResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
