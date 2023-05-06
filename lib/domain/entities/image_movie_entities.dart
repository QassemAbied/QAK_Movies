import 'package:equatable/equatable.dart';

class ImageMovieEntities extends Equatable {
  final String images;
  ImageMovieEntities({required this.images});

  @override
  List<Object?> get props => [images];
}
