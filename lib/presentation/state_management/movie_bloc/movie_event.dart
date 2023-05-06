import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularEvent extends MovieEvent {}

class GenreEvent extends MovieEvent {}

class MovieByGenreEvent extends MovieEvent {
  final int id;
  final String name;
  MovieByGenreEvent(this.id, this.name);
  @override
  List<Object> get props => [id, name];
}

class TopRatedEvent extends MovieEvent {}

class UpComingEvent extends MovieEvent {}

class TrendEvent extends MovieEvent {}
