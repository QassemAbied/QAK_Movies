import 'package:json_annotation/json_annotation.dart';
part 'add_watch_list_response.g.dart';
@JsonSerializable()
class AddWatchListResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'status_message')
  final String? statusMessage;

  AddWatchListResponse(this.statusCode, this.statusMessage);
  factory AddWatchListResponse.fromJson(Map<String, dynamic> json) =>
      _$AddWatchListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddWatchListResponseToJson(this);
}