import 'package:untitled3/core/network/api_result.dart';

import '../models/profile_response.dart';

abstract class ProfileRepos {
  Future<ApiResult<ProfileResponse>> getProfile();
}