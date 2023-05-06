import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

//import 'media_detail.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Madia extends Equatable {
  @HiveField(0)
  final int tmdbID;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterUrl;
  @HiveField(3)
  final String backdropUrl;
  @HiveField(4)
  final double voteAverage;
  @HiveField(5)
  final String releaseDate;
  @HiveField(6)
  final String overview;

  // @HiveField(7)
  // final bool isMovie;

  const Madia({
    required this.tmdbID,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
    //  required this.isMovie,
  });

  @override
  List<Object?> get props =>
      [
        tmdbID,
        title,
        posterUrl,
        backdropUrl,
        voteAverage,
        releaseDate,
        overview,
        // isMovie,
      ];

  factory Madia.fromMediaDetails(Map<String, dynamic>mediaDetails) {
    return Madia(
      tmdbID: mediaDetails['id'],
      title: mediaDetails['title'],
      posterUrl: mediaDetails['poster_path'] != null
          ? mediaDetails['poster_path']
          : '',
      backdropUrl: mediaDetails['backdrop_path'] != null
          ? mediaDetails['backdrop_path']
          : '',
      voteAverage: mediaDetails['vote_average'].toDouble(),
      releaseDate: mediaDetails['release_date'],
      overview: mediaDetails['overview'],
      // isMovie: mediaDetails,
    );
  }

}
