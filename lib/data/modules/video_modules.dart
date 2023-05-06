import '../../domain/entities/video_entities.dart';

class VideoModules extends VideoEntities{
  VideoModules({required int id}) : super(id: id);

  factory VideoModules.fromJson(Map<String , dynamic> json)=>
      VideoModules(id:json ['id']);

}