import 'package:bloc/bloc.dart';
import 'package:untitled3/core/enum.dart';
import 'package:untitled3/domain/use_case/details_use_case/castmovie_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/check_account_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/detail_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/imagemovie_uescase.dart';
import 'package:untitled3/domain/use_case/details_use_case/similar_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/video_use_case.dart';
import 'package:untitled3/presentation/state_management/movie_details_bloc/details_event.dart';
import 'package:untitled3/presentation/state_management/movie_details_bloc/details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailEvent , MovieDetailsState>{
  final getDetailsMovieUseCase detailsMovieUseCase;
  final getImageMovieUseCase imageMovieUseCase;
  final getCastMovieUseCase castMovieUseCase;
  final getSimilarMovieUseCase similarMovieUseCase;
  final getCheckAccountStatesUseCase checkAccountStatesUseCase;
  final getVideoMovieUseCase videoMovieUseCase;
  MovieDetailsBloc(
      this.detailsMovieUseCase,
      this.imageMovieUseCase,
      this.castMovieUseCase,
      this.similarMovieUseCase,
      this.checkAccountStatesUseCase,
      this.videoMovieUseCase,
      ) : super(MovieDetailsState()){



    on<DetailsEvent>((event, emit) async{
      final response = await detailsMovieUseCase.call(event.id);
      response.fold((l) {
        emit(state.copyWith(enumRequestdetails: EnumRequest.error , messagedetails: l.toString()));
      }, (r) {
        emit(state.copyWith(detailsData: r , enumRequestdetails: EnumRequest.loded));
      });
    });



    on<ImageForMovieEvent>((event, emit) async{
      final response = await imageMovieUseCase.call(ImageMovieId(event.id));

      response.fold((l) {
        emit(state.copyWith(enumRequestimageMovie: EnumRequest.error , messageimageMovie: l.toString()));
      }, (r) {
        emit(state.copyWith(imageMovieData: r , enumRequestimageMovie: EnumRequest.loded));
      });
    });



    on<CastMovieEvent>((event, emit) async{
      final response = await castMovieUseCase.call(CastMovieId(event.id));

      response.fold((l) {
        emit(state.copyWith(enumRequestcastMovie: EnumRequest.error , messagecastMovie: l.toString()));
      }, (r) {
        emit(state.copyWith(castMovieData: r , enumRequestcastMovie: EnumRequest.loded));
      });
    });



    on<SimilarMovieEvent>((event, emit) async{
      final response = await similarMovieUseCase.call(SimilarId(event.id));

      response.fold((l) {
        emit(state.copyWith(enumRequestsimilarMovie: EnumRequest.error , messagesimilarMovie: l.toString()));
      }, (r) {
        emit(state.copyWith(similarMovieData: r , enumRequestsimilarMovie: EnumRequest.loded));
      });
    });

    on<CheckAccountStatesEvent>((event, emit) async{
      final response = await checkAccountStatesUseCase.call(event.id);

      response.fold((l) {
        emit(state.copyWith(enumRequestcheckaccount: EnumRequest.error , messagecheckaccount: l.toString()));
      }, (r) {
        emit(state.copyWith(checkaccount: r , enumRequestcheckaccount: EnumRequest.loded));
      });
    });


    on<VideoMovieEvent>((event, emit) async{
      final response = await videoMovieUseCase.call(event.id);

      response.fold((l) {
        emit(state.copyWith(enumRequestvideo: EnumRequest.error , messagevideo: l.toString()));
      }, (r) {
        emit(state.copyWith(video: r , enumRequestvideo: EnumRequest.loded));
      });
    });
  }

}