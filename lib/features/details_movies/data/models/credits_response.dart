import 'package:json_annotation/json_annotation.dart';
part 'credits_response.g.dart';
@JsonSerializable()
class CreditsResponse {
  final int? id;
  final List<Cast>? cast;
  //final List<Crew>? crew;

  CreditsResponse({this.id, this.cast, });

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsResponseToJson(this);
}
@JsonSerializable()
class Cast {
  final bool? adult;
  final int? gender;
  final int? id;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: 'original_name')
  final String? originalName;
  final double? popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'cast_id')
  final int? castId;
  final String? character;
  @JsonKey(name: 'credit_id')
  final String? creditId;
  final int? order;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
// @JsonSerializable()
// class Crew {
//   final bool? adult;
//   final int? gender;
//   final int? id;
//   @JsonKey(name: 'known_for_department')
//   final String? knownForDepartment;
//   final String? name;
//   @JsonKey(name: 'original_name')
//   final String? originalName;
//   final double? popularity;
//   @JsonKey(name: 'profile_path')
//   final String? profilePath;
//   @JsonKey(name: 'credit_id')
//   final String? creditId;
//   final String? department;
//   final String? job;
//
//   Crew({
//     this.adult,
//     this.gender,
//     this.id,
//     this.knownForDepartment,
//     this.name,
//     this.originalName,
//     this.popularity,
//     this.profilePath,
//     this.creditId,
//     this.department,
//     this.job,
//   });
//
//   factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CrewToJson(this);
// }
