import 'package:json_annotation/json_annotation.dart';
part 'add_fav_response.g.dart';
@JsonSerializable()
class AddFavResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'status_message')
  final String? statusMessage;

  AddFavResponse(this.statusCode, this.statusMessage);
  factory AddFavResponse.fromJson(Map<String, dynamic> json) =>
      _$AddFavResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavResponseToJson(this);
}