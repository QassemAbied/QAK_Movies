import 'package:untitled3/core/network/api_error_handler.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/core/network/api_services.dart';
import 'package:untitled3/features/profile/data/models/profile_response.dart';
import 'package:untitled3/features/profile/data/repos/profile_repos.dart';

class ProfileReposImpl implements ProfileRepos {
  final ApiServices _apiServices;
  ProfileReposImpl(this._apiServices);
  @override
  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await _apiServices.getProfile();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
