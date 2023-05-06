import 'package:bloc/bloc.dart';
import 'package:untitled3/core/base_usecase.dart';
import 'package:untitled3/core/enum.dart';
import 'package:untitled3/domain/use_case/movies_use_case/moviebygenre_usecase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/popular_usecase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/toprated_usecase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/trend_usecase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/upcoming_usecase.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_event.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_state.dart';

import '../../../domain/use_case/movies_use_case/genre_usecase.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final getPopularUseCase popularUseCase;
  final getGenreUseCase genreUseCase;
  final getMovieByGenresUseCase movieByGenresUseCase;
  final getTopRatedUseCase topRatedUseCase;
  final getUpComingUseCase upComingUseCase;
  final getTrendUseCase trendUseCase;
  MovieBloc(
    this.popularUseCase,
    this.genreUseCase,
    this.movieByGenresUseCase,
    this.topRatedUseCase,
    this.upComingUseCase,
    this.trendUseCase,
  ) : super(MovieState()) {
    on<PopularEvent>((event, emit) async {
      final result = await popularUseCase.call(NoParameter());

      result.fold((l) {
        emit(state.copyWith(
            enumRequestPopular: EnumRequest.error, messagePopular: l.message));
      }, (r) {
        emit(state.copyWith(
            popularData: r, enumRequestPopular: EnumRequest.loded));
      });
    });

    on<GenreEvent>((event, emit) async {
      final result = await genreUseCase.call(NoParameter());

      result.fold((l) {
        emit(state.copyWith(
            enumRequestGenre: EnumRequest.error, messageGenre: l.message));
      }, (r) {
        emit(state.copyWith(genreData: r, enumRequestGenre: EnumRequest.loded));
      });
    });

    on<MovieByGenreEvent>((event, emit) async {
      final result = await movieByGenresUseCase.call(GenreId(event.id));

      result.fold((l) {
        emit(state.copyWith(
            enumRequestMovieByGenre: EnumRequest.error,
            messageMovieByGenre: l.message));
      }, (r) {
        emit(state.copyWith(
            movieByGenreData: r, enumRequestMovieByGenre: EnumRequest.loded));
      });
    });

    on<TopRatedEvent>((event, emit) async {
      final result = await topRatedUseCase.call(NoParameter());

      result.fold((l) {
        emit(state.copyWith(
            enumRequesttoprated: EnumRequest.error,
            messagetoprated: l.message));
      }, (r) {
        emit(state.copyWith(
            topratedData: r, enumRequesttoprated: EnumRequest.loded));
      });
    });

    on<UpComingEvent>((event, emit) async {
      final result = await upComingUseCase.call(NoParameter());

      result.fold((l) {
        emit(state.copyWith(
            enumRequestupcoming: EnumRequest.error,
            messageupcoming: l.message));
      }, (r) {
        emit(state.copyWith(
            upcomingData: r, enumRequestupcoming: EnumRequest.loded));
      });
    });

    on<TrendEvent>((event, emit) async {
      final result = await trendUseCase.call(NoParameter());

      result.fold((l) {
        emit(state.copyWith(
            enumRequesttred: EnumRequest.error, messagetred: l.message));
      }, (r) {
        emit(state.copyWith(tredData: r, enumRequesttred: EnumRequest.loded));
      });
    });
  }
}
