import 'package:json_annotation/json_annotation.dart';
part 'images_movies_response.g.dart';
@JsonSerializable()
class ImagesMoviesResponse {
  final List<Backdrops>? backdrops;

  ImagesMoviesResponse({this.backdrops});

  factory ImagesMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesMoviesResponseToJson(this);
}
@JsonSerializable()
class Backdrops {
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  @JsonKey(name: 'file_path')
  final String? filePath;
  @JsonKey(name: 'vote_Average')
  final double? voteAverage;
  @JsonKey(name: 'vote_Count')
  final int? voteCount;
  final int? width;

  Backdrops({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Backdrops.fromJson(Map<String, dynamic> json) =>
      _$BackdropsFromJson(json);

  Map<String, dynamic> toJson() => _$BackdropsToJson(this);
}
