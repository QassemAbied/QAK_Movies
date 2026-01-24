import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/api_result.dart';
import '../data/models/movies_genres_models.dart';
import '../data/repos/movies_repos.dart';
import 'genres_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final MoviesRepository moviesRepository;

  GenreCubit(this.moviesRepository) : super(const GenreState.initial());


  Future<void> loadGenresMovies(String language,) async {
    emit(GenreState.genresLoading());
    final response = await moviesRepository.getGenreList(language: language);
    response.when(
        success: (genresModels)async{
          final genres= genresModels.genres??[];
          if (genres.isEmpty) {
            emit(
              const GenreState.genresSuccess(
                genres: [],
                moviesByGenres: [], selectedGenreId: -1,
              ),
            );
            return;
          }
          final firstGenreId = genres.first.id!;
          _loadMovies(genreId: firstGenreId, genres: genres, language: language);


        },
        failure: (error){
          emit(GenreState.genresError(error: error));
        }
    );
  }
  Future<void> changeGenre({
    required int genreId,
    required String language,
  }) async {
    final currentState = state;
    if (currentState is! GenresSuccess) return;

    await _loadMovies(
      genreId: genreId,
      genres: currentState.genres,
      language: language,
    );
  }
  Future<void> _loadMovies({
    required int genreId,
    required List<GenresModels> genres,
    required String language,
  }) async {
    final moviesResult =
    await moviesRepository.getMoviesByGenre(
      genreId: genreId,
      language: language,
    );

    moviesResult.when(
      success: (moviesResponse) {
        emit(
          GenreState.genresSuccess(
            genres: genres,
            moviesByGenres: moviesResponse.results ?? [],
            selectedGenreId: genreId,
          ),
        );
      },
      failure: (error) {
        emit(GenreState.genresError(error: error));
      },
    );
  }

}
