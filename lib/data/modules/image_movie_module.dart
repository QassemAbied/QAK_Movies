import 'package:untitled3/domain/entities/image_movie_entities.dart';

class ImageMovieModule extends ImageMovieEntities {
  ImageMovieModule({required String images}) : super(images: images);
  factory ImageMovieModule.fromJson(Map<String, dynamic> json) =>
      ImageMovieModule(images: json['file_path']);
}
