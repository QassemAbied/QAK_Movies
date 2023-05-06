import 'package:untitled3/domain/entities/cast_entities.dart';

class CastMovieModule extends CastEntities {
  CastMovieModule(
      {required String name,
      required String known_for_department,
      required String profile_path,
      required String character,
      required String credit_id})
      : super(
            name: name,
            known_for_department: known_for_department,
            profile_path: profile_path,
            character: character,
            credit_id: credit_id);

  factory CastMovieModule.fromJson(Map<String, dynamic> json) =>
      CastMovieModule(
        name: json['name'],
        known_for_department: json['known_for_department'],
        profile_path: json['profile_path'] != null ? json['profile_path'] : '',
        character: json['character'],
        credit_id: json['credit_id'],
      );
}
