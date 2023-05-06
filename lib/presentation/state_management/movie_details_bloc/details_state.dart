import 'package:equatable/equatable.dart';
import 'package:untitled3/core/enum.dart';
import 'package:untitled3/domain/entities/cast_entities.dart';
import 'package:untitled3/domain/entities/image_movie_entities.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';

import '../../../domain/entities/check_account_states.dart';
import '../../../domain/entities/video_entities.dart';

class MovieDetailsState extends Equatable{
  final MovieEntities? detailsData;
  final EnumRequest enumRequestdetails;
  final String messagedetails;

  final List<ImageMovieEntities> imageMovieData;
  final EnumRequest enumRequestimageMovie;
  final String messageimageMovie;

  final List<CastEntities> castMovieData;
  final EnumRequest enumRequestcastMovie;
  final String messagecastMovie;


  final List<MovieEntities> similarMovieData;
  final EnumRequest enumRequestsimilarMovie;
  final String messagesimilarMovie;


  final CheckAccountStates? checkaccount;
  final EnumRequest enumRequestcheckaccount;
  final String messagecheckaccount;

  final String? video;
  final EnumRequest enumRequestvideo;
  final String messagevideo;
  MovieDetailsState({
    this.detailsData ,
    this.enumRequestdetails = EnumRequest.loding,
    this.messagedetails = '',

    this.imageMovieData = const[],
    this.enumRequestimageMovie= EnumRequest.loding,
    this.messageimageMovie = '',

    this.castMovieData = const[],
    this.enumRequestcastMovie= EnumRequest.loding,
    this.messagecastMovie = '',

    this.similarMovieData = const[],
    this.enumRequestsimilarMovie= EnumRequest.loding,
    this.messagesimilarMovie = '',

    this.checkaccount ,
    this.enumRequestcheckaccount = EnumRequest.loding,
    this.messagecheckaccount = '',

    this.video,
    this.enumRequestvideo= EnumRequest.loding,
    this.messagevideo = '',
});
  MovieDetailsState copyWith({
    final MovieEntities? detailsData ,
    final EnumRequest? enumRequestdetails ,
    final String? messagedetails,

    final List<ImageMovieEntities>? imageMovieData,
    final EnumRequest? enumRequestimageMovie,
    final String? messageimageMovie,

    final List<CastEntities>? castMovieData,
    final EnumRequest? enumRequestcastMovie,
    final String? messagecastMovie,

    final List<MovieEntities>? similarMovieData,
    final EnumRequest? enumRequestsimilarMovie,
    final String? messagesimilarMovie,

    final CheckAccountStates? checkaccount,
    final EnumRequest? enumRequestcheckaccount,
    final String? messagecheckaccount,


    final String? video ,
    final EnumRequest? enumRequestvideo ,
    final String? messagevideo  ,
})
  {
    return MovieDetailsState(
      detailsData: detailsData??this.detailsData,
      enumRequestdetails: enumRequestdetails??this.enumRequestdetails,
      messagedetails: messagedetails??this.messagedetails,

      imageMovieData: imageMovieData??this.imageMovieData,
      enumRequestimageMovie: enumRequestimageMovie??this.enumRequestimageMovie,
      messageimageMovie: messageimageMovie??this.messageimageMovie,

      castMovieData: castMovieData??this.castMovieData,
      enumRequestcastMovie: enumRequestcastMovie??this.enumRequestcastMovie,
      messagecastMovie: messagecastMovie??this.messagecastMovie,


      similarMovieData: similarMovieData??this.similarMovieData,
      enumRequestsimilarMovie: enumRequestsimilarMovie??this.enumRequestsimilarMovie,
      messagesimilarMovie: messagesimilarMovie??this.messagesimilarMovie,

      checkaccount: checkaccount??this.checkaccount,
      enumRequestcheckaccount: enumRequestcheckaccount??this.enumRequestcheckaccount,
      messagecheckaccount: messagecheckaccount??this.messagecheckaccount,

      video: video??this.video ,
      enumRequestvideo: enumRequestvideo??this.enumRequestvideo,
      messagevideo: messagevideo??this.messagevideo,
    );
  }

  @override
  List<Object?> get props => [
    detailsData , enumRequestdetails , messagedetails,
    imageMovieData , enumRequestimageMovie , messageimageMovie,
    castMovieData , enumRequestcastMovie , messagecastMovie,
    similarMovieData , enumRequestsimilarMovie , messagesimilarMovie,
    checkaccount , enumRequestcheckaccount , messagecheckaccount ,
    video , enumRequestvideo , messagevideo

  ];
}