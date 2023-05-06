import 'package:equatable/equatable.dart';

class CastEntities extends Equatable{
  final String name;
  final String known_for_department ;
  final String profile_path;
  final String character;
  final String credit_id;
CastEntities({required this.name , required this.known_for_department , required this.profile_path,
required this.character , required this.credit_id
});

  @override
  List<Object?> get props => [];
}