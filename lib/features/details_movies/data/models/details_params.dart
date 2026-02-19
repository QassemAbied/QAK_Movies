import 'package:equatable/equatable.dart';


class DetailsParams extends Equatable {
  final int movieId;
  final String language;

  const DetailsParams({
    required this.movieId,
    required this.language,
  });

  @override
  List<Object> get props => [movieId, language];
}

