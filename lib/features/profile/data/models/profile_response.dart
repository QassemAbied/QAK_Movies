import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';
@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: 'avatar')
 final Avatar? avatar;
  @JsonKey(name: 'id')
 final int? id;
  @JsonKey(name: 'iso_639_1')
 final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
 final String? iso31661;
  @JsonKey(name: 'name')
 final String? name;
  @JsonKey(name: 'include_adult')
 final bool? includeAdult;
  @JsonKey(name: 'username')
 final String? username;

  ProfileResponse(
      {this.avatar,
        this.id,
        this.iso6391,
        this.iso31661,
        this.name,
        this.includeAdult,
        this.username});
  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

}
@JsonSerializable()

class Avatar {
  @JsonKey(name: 'gravatar')
 final Gravatar? gravatar;
  @JsonKey(name: 'tmdb')
final Tmdb? tmdb;

  Avatar({this.gravatar, this.tmdb});
  factory Avatar.fromJson(Map<String, dynamic> json) =>
      _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);

}
@JsonSerializable()

class Gravatar {
  @JsonKey(name: 'hash')
 final String? hash;

  Gravatar({this.hash});

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);

  Map<String, dynamic> toJson() => _$GravatarToJson(this);
}
@JsonSerializable()

class Tmdb {
  @JsonKey(name: 'avatar_path')
 final String? avatarPath;

  Tmdb({this.avatarPath});
  factory Tmdb.fromJson(Map<String, dynamic> json) =>
      _$TmdbFromJson(json);

  Map<String, dynamic> toJson() => _$TmdbToJson(this);
}