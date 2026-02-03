import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/home/data/models/movies_category.dart';
import 'package:untitled3/features/home/data/repos/movies_repos.dart';
import '../../../core/network/api_result.dart';
import 'movies_state.dart' hide Success;

class HomeCubit extends Cubit<HomeState> {
  final MoviesRepository moviesRepository;

  HomeCubit(this.moviesRepository) : super(const HomeState.initial());

  Future<void> loadHome(String language) async {
    if (isClosed) return;

    emit(const HomeState.loading());

    final results = await Future.wait([
      moviesRepository.getMoviesByCategory(
        category: MovieCategory.trend,
        page: 1,
        language: language,
      ),
      moviesRepository.getMoviesByCategory(
        category: MovieCategory.nowPlaying,
        page: 1,
        language: language,
      ),
      moviesRepository.getMoviesByCategory(
        category: MovieCategory.upcoming,
        page: 1,
        language: language,
      ),
      moviesRepository.getMoviesByCategory(
        category: MovieCategory.popular,
        page: 1,
        language: language,
      ),
      moviesRepository.getMoviesByCategory(
        category: MovieCategory.topRated,
        page: 1,
        language: language,
      ),



    ]);

    if (isClosed) return;
    String? errorMessage;

    for (final result in results) {
      ApiResultPatterns(result).maybeWhen(
        failure: (error) {
          errorMessage ??= error.message;
        },
        orElse: () {},
      );
    }

    if (errorMessage != null) {
      emit(HomeState.error(error: errorMessage!));
      return;
    }



    emit(
      HomeState.success(
        trend: (results[0] as Success).data.results ?? [],
        nowPlaying: (results[1] as Success).data.results ?? [],
        upcoming: (results[2] as Success).data.results ?? [],
        popular: (results[3] as Success).data.results ?? [],
        topRated: (results[4] as Success).data.results ?? [],


      ),
    );
  }

}


