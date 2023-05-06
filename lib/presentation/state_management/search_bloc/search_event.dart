import 'package:equatable/equatable.dart';

abstract class SearchMovieEvent extends Equatable
{


  @override
  List<Object> get props =>[];
}
class SearchEvent extends SearchMovieEvent{
  final String value;
  SearchEvent(this.value);
  @override
  List<Object> get props =>[value];
}
