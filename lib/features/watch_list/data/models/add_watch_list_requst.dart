
import 'package:json_annotation/json_annotation.dart';
part 'add_watch_list_requst.g.dart';
@JsonSerializable()
class AddWatchListRequest {
  @JsonKey(name: 'media_type')
  final String mediaType;
  @JsonKey(name: 'media_id')
  final int mediaId;
  @JsonKey(name: 'watchlist')
  final bool watchlist;

  AddWatchListRequest(
      this.mediaType,
      this.mediaId,
      this.watchlist,
      );

  Map<String, dynamic> toJson() => _$AddWatchListRequestToJson(this);
}
