import 'package:untitled3/domain/entities/session_entities.dart';

class SessionModules extends SessionEntities {
  SessionModules({required bool success, required String session_id})
      : super(success: success, session_id: session_id);

  factory SessionModules.fromJson(Map<String, dynamic> json) =>
      SessionModules(success: json['success'], session_id: json['session_id']);
}
