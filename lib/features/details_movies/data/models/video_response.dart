

import 'package:json_annotation/json_annotation.dart';
part 'video_response.g.dart';
@JsonSerializable()
class VideoResponses {
 final int? id;
 final List<VideoResults>? results;

  VideoResponses({this.id, this.results});

 factory VideoResponses.fromJson(Map<String, dynamic> json) =>
     _$VideoResponsesFromJson(json);

 Map<String, dynamic> toJson() => _$VideoResponsesToJson(this);
}
@JsonSerializable()
class VideoResults {
 final String? iso6391;
 final String? iso31661;
 final String? name;
 final String? key;
 final String? site;
 final int? size;
 final String? type;
 final bool? official;
 final String? publishedAt;
 final String? id;

  VideoResults(
      {this.iso6391,
        this.iso31661,
        this.name,
        this.key,
        this.site,
        this.size,
        this.type,
        this.official,
        this.publishedAt,
        this.id});

  factory VideoResults.fromJson(Map<String, dynamic> json) =>
      _$VideoResultsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResultsToJson(this);
}