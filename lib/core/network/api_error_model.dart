import 'package:json_annotation/json_annotation.dart';



part 'api_error_model.g.dart';
@JsonSerializable()
class ApiErrorModel  {
  @JsonKey(name: 'status_message')
  final String message;
  @JsonKey(name: 'status_code')
  final int? code;
  @JsonKey(name: 'success')
  final bool? success;

  ApiErrorModel ({required this.message,required this.code,required this.success});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}