import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable
{


  @override
  List<Object> get props =>[];
}
class DetailsEvent extends MovieDetailEvent{
  final int id;
  DetailsEvent({required this.id} );
  @override
  List<Object> get props =>[id];
}

class ImageForMovieEvent extends MovieDetailEvent{
  final int id;
  ImageForMovieEvent(this.id);
  @override
  List<Object> get props =>[id];
}

class CastMovieEvent extends MovieDetailEvent{
  final int id;
  CastMovieEvent(this.id);
  @override
  List<Object> get props =>[id];
}

class SimilarMovieEvent extends MovieDetailEvent{
  final int id;
  SimilarMovieEvent(this.id);
  @override
  List<Object> get props =>[id];
}

class CheckAccountStatesEvent extends MovieDetailEvent{
  final int id;

  CheckAccountStatesEvent(this.id);
  @override
  List<Object> get props =>[id];
}

class VideoMovieEvent extends MovieDetailEvent{
  final int id;
  VideoMovieEvent(this.id);
  @override
  List<Object> get props =>[id];
}