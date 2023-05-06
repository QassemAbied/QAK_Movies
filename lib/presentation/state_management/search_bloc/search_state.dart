import 'package:equatable/equatable.dart';
import 'package:untitled3/core/enum.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';

class SearchMovieState extends Equatable {
  final List<MovieEntities> searchData;
  final EnumRequest enumRequestsearch;
  final String messagesearch;

  SearchMovieState({
    this.searchData = const [],
    this.enumRequestsearch = EnumRequest.loding,
    this.messagesearch = '',
  });
  SearchMovieState copyWith({
    final List<MovieEntities>? searchData,
    final EnumRequest? enumRequestsearch,
    final String? messagesearch,
  }) {
    return SearchMovieState(
      searchData: searchData ?? this.searchData,
      enumRequestsearch: enumRequestsearch ?? this.enumRequestsearch,
      messagesearch: messagesearch ?? this.messagesearch,
    );
  }

  @override
  List<Object?> get props => [
        searchData,
        enumRequestsearch,
        messagesearch,
      ];
}
