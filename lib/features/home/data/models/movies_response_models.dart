import 'package:json_annotation/json_annotation.dart';

import '../../../details_movies/data/models/details_movies_response.dart';
part 'movies_response_models.g.dart';

@JsonSerializable()
class MoviesResponse {
  final int? page;
  final List<MovieModel>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  MoviesResponse({this.page, this.results, this.totalPages, this.totalResults});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable()
class MovieModel {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'overview')
  final String? overview;
  @JsonKey(name: 'popularity')
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'video')
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  MovieModel.fromDetails(DetailsMoviesResponse details)
      : adult = details.adult,
        backdropPath = details.backdropPath,
        genreIds = details.genres?.map((e) => e.id ?? 0).toList(),
        id = details.id,
        originalLanguage = details.originalLanguage,
        originalTitle = details.originalTitle,
        overview = details.overview,
        popularity = details.popularity,
        posterPath = details.posterPath,
        releaseDate = details.releaseDate,
        title = details.title,
        video = details.video,
        voteAverage = details.voteAverage,
        voteCount = details.voteCount;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
