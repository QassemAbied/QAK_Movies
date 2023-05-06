// import '../../domain/entities/movie.dart';
//
// class WatchlistItemModel extends Media {
//   WatchlistItemModel({required int tmdbID, required String title,
//     required String posterUrl, required String backdropUrl, required double voteAverage,
//     required String releaseDate, required String overview}) : super(tmdbID: tmdbID, title: title,
//       posterUrl: posterUrl, backdropUrl: backdropUrl, voteAverage: voteAverage, releaseDate: releaseDate,
//       overview: overview);
//
//
//   factory WatchlistItemModel.fromEntity(Media media) {
//     return WatchlistItemModel(
//       tmdbID: media.tmdbID,
//       title: media.title,
//       releaseDate: media.releaseDate,
//       voteAverage: media.voteAverage,
//       posterUrl: media.posterUrl,
//       backdropUrl: media.backdropUrl,
//       overview: media.overview,
//       //isMovie: media.isMovie,
//     );
//   }
// }