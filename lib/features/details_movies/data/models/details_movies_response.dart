import 'package:json_annotation/json_annotation.dart';
part 'details_movies_response.g.dart';
@JsonSerializable()
class DetailsMoviesResponse {
 final bool? adult;
 @JsonKey(name: 'backdrop_path')
 final String? backdropPath;
 //final Null? belongsToCollection;
 @JsonKey(name: 'budget')
final  int? budget;
 @JsonKey(name: 'genres')
 final List<Genres>? genres;
 @JsonKey(name: 'homepage')
 final String? homepage;
 @JsonKey(name: 'id')
 final int? id;
 @JsonKey(name: 'imdb_id')
 final String? imdbId;
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
 @JsonKey(name: 'production_companies')
 final  List<ProductionCompanies>? productionCompanies;
 @JsonKey(name: 'production_countries')
 final List<ProductionCountries>? productionCountries;
 @JsonKey(name: 'release_date')
 final String? releaseDate;
 @JsonKey(name: 'revenue')
 final int? revenue;
 @JsonKey(name: 'runtime')
 final  int? runtime;
 @JsonKey(name: 'spoken_languages')
 final List<SpokenLanguages>? spokenLanguages;
 @JsonKey(name: 'status')
 final String? status;
 @JsonKey(name: 'tagline')
 final String? tagline;
 @JsonKey(name: 'title')
 final String? title;
 @JsonKey(name: 'video')
 final bool? video;
 @JsonKey(name: 'vote_average')
 final double? voteAverage;
 @JsonKey(name: 'vote_count')
 final int? voteCount;

 DetailsMoviesResponse(
      {this.adult,
        this.backdropPath,
      //  this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});
 factory DetailsMoviesResponse.fromJson(Map<String, dynamic> json) =>
     _$DetailsMoviesResponseFromJson(json);

 Map<String, dynamic> toJson() => _$DetailsMoviesResponseToJson(this);

}
@JsonSerializable()
class Genres {
 final int? id;
 final String? name;

  Genres({this.id, this.name});
 factory Genres.fromJson(Map<String, dynamic> json) =>
     _$GenresFromJson(json);

 Map<String, dynamic> toJson() => _$GenresToJson(this);


}
@JsonSerializable()
class ProductionCompanies {
 final int? id;
 @JsonKey(name: 'logo_path')
 final String? logoPath;
 final String? name;
 @JsonKey(name: 'origin_country')
 final String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});
 factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
     _$ProductionCompaniesFromJson(json);

 Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);


}
@JsonSerializable()
class ProductionCountries {
 final String? iso31661;
 final String? name;

  ProductionCountries({this.iso31661, this.name});
 factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
     _$ProductionCountriesFromJson(json);

 Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);


}
@JsonSerializable()
class SpokenLanguages {
  @JsonKey(name: 'english_name')
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});
  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);

}
