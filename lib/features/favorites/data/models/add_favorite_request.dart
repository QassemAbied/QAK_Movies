
import 'package:json_annotation/json_annotation.dart';
part 'add_favorite_request.g.dart';
@JsonSerializable()
class AddFavoriteRequest {
  @JsonKey(name: 'media_type')
  final String mediaType;
  @JsonKey(name: 'media_id')
  final int mediaId;
  @JsonKey(name: 'favorite')
  final bool favorite;

  AddFavoriteRequest(
     this.mediaType,
     this.mediaId,
     this.favorite,
  );

  Map<String, dynamic> toJson() => _$AddFavoriteRequestToJson(this);
}
