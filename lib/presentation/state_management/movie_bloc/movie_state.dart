import 'package:equatable/equatable.dart';
import 'package:untitled3/core/enum.dart';
import 'package:untitled3/domain/entities/genre_entities.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';

class MovieState extends Equatable
{
  final List<MovieEntities> popularData;
  final EnumRequest enumRequestPopular ;
  final String messagePopular ;

  final List<GenreEntities> genreData;
  final EnumRequest enumRequestGenre ;
  final String messageGenre ;

  final List<MovieEntities> movieByGenreData;
  final EnumRequest enumRequestMovieByGenre ;
  final String messageMovieByGenre ;

  final List<MovieEntities> topratedData;
  final EnumRequest enumRequesttoprated ;
  final String messagetoprated ;


  final List<MovieEntities> upcomingData;
  final EnumRequest enumRequestupcoming ;
  final String messageupcoming ;

  final List<MovieEntities> tredData;
  final EnumRequest enumRequesttred;
  final String messagetred ;
  MovieState({
      this.popularData = const [] ,
     this.enumRequestPopular= EnumRequest.loding ,
     this.messagePopular = '',

    this.genreData = const[],
    this.enumRequestGenre = EnumRequest.loding,
    this.messageGenre = '',

    this.movieByGenreData = const[],
    this.enumRequestMovieByGenre = EnumRequest.loding,
    this.messageMovieByGenre = '',

    this.topratedData = const [],
    this.enumRequesttoprated= EnumRequest.loding,
    this.messagetoprated ='',

    this.upcomingData = const [],
    this.enumRequestupcoming= EnumRequest.loding,
    this.messageupcoming ='',

    this.tredData = const [],
    this.enumRequesttred= EnumRequest.loding,
    this.messagetred ='',
  });
  MovieState copyWith({
    final List<MovieEntities>? popularData ,
    final EnumRequest? enumRequestPopular ,
    final String? messagePopular ,

    final List<GenreEntities>? genreData,
    final EnumRequest? enumRequestGenre ,
    final String? messageGenre ,


    final List<MovieEntities>? movieByGenreData ,
    final EnumRequest? enumRequestMovieByGenre ,
    final String? messageMovieByGenre ,

    final List<MovieEntities>? topratedData ,
    final EnumRequest? enumRequesttoprated ,
    final String? messagetoprated ,


    final List<MovieEntities>? upcomingData ,
    final EnumRequest? enumRequestupcoming ,
    final String? messageupcoming ,

    final List<MovieEntities>? tredData,
    final EnumRequest? enumRequesttred,
    final String? messagetred ,
  })
  {
    return MovieState(
      popularData: popularData??this.popularData,
      enumRequestPopular: enumRequestPopular??this.enumRequestPopular,
      messagePopular: messagePopular??this.messagePopular,

      genreData: genreData??this.genreData,
      enumRequestGenre: enumRequestGenre??this.enumRequestGenre,
      messageGenre: messagePopular??this.messagePopular,

      movieByGenreData: movieByGenreData??this.movieByGenreData,
      messageMovieByGenre: messageMovieByGenre??this.messageMovieByGenre,
      enumRequestMovieByGenre: enumRequestMovieByGenre??this.enumRequestMovieByGenre,

      topratedData: topratedData??this.topratedData,
      enumRequesttoprated: enumRequesttoprated??this.enumRequesttoprated,
      messagetoprated: messagetoprated??this.messagetoprated,


      upcomingData: upcomingData??this.upcomingData,
      enumRequestupcoming: enumRequestupcoming??this.enumRequestupcoming,
      messageupcoming: messageupcoming??this.messageupcoming,


      tredData: tredData??this.tredData,
      enumRequesttred: enumRequesttred??this.enumRequesttred,
      messagetred: messagetred??this.messagetred,
    );
  }

  @override
  List<Object?> get props => [popularData , enumRequestPopular , messagePopular,
    genreData , enumRequestGenre , messagePopular,
    movieByGenreData , enumRequestMovieByGenre , messageMovieByGenre,
    topratedData , enumRequesttoprated , messagetoprated,
    upcomingData , enumRequestupcoming , messageupcoming,
    tredData , enumRequesttred , messagetred,
  ];

}