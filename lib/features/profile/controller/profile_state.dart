import 'package:untitled3/features/favorites/data/models/add_fav_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled3/features/profile/data/models/profile_response.dart';
import '../../home/data/models/movies_response_models.dart';
part 'profile_state.freezed.dart';
@Freezed()
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = Loading;

  const factory ProfileState.success({
    required ProfileResponse profileResponse,


  }) = Success;

  const factory ProfileState.error({required String error}) = Error;

}