import 'package:bloc/bloc.dart';
import 'package:untitled3/core/enum.dart';
import 'package:untitled3/domain/use_case/search_usecase.dart';
import 'package:untitled3/presentation/state_management/search_bloc/search_event.dart';
import 'package:untitled3/presentation/state_management/search_bloc/search_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent , SearchMovieState>{
  final getSearchMovieUseCase searchMovieUseCase;

  SearchMovieBloc(
      this.searchMovieUseCase,

      ) : super(SearchMovieState()){



    on<SearchEvent>((event, emit) async{
      final response = await searchMovieUseCase.call(SearchValue(event.value));
      response.fold((l) {
        emit(state.copyWith(enumRequestsearch: EnumRequest.error , messagesearch: l.toString()));
      }, (r) {
        emit(state.copyWith(searchData: r , enumRequestsearch: EnumRequest.loded));
      });
    });




  }

}