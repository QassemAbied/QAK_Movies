import 'package:untitled3/features/details_movies/data/models/video_response.dart';

import '../../../home/data/models/movies_response_models.dart';
import 'credits_response.dart';
import 'details_movies_response.dart';
import 'images_movies_response.dart';

class DetailsData {
  final DetailsMoviesResponse details;
  final ImagesMoviesResponse backdrops;
  final CreditsResponse cast;
  final VideoResponses videos;
  final MoviesResponse similarMovies;

  DetailsData({
    required this.details,
    required this.backdrops,
    required this.cast,
    required this.videos,
    required this.similarMovies,
  });
}
