import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/features/profile/controller/profile_riverpod.dart';
import 'package:untitled3/features/profile/data/models/profile_response.dart';
import 'package:untitled3/features/profile/data/repos/profile_repos.dart';
import 'package:untitled3/features/profile/data/repos/profile_repos_impl.dart';

import '../core/network/api_services.dart';
import '../core/network/dio_factory.dart';

final apiServicesProvider = Provider<ApiServices>((ref) {
  final dio = DioFactory.getDio();
  return ApiServices(dio);
});

final profileRepoProvider = Provider<ProfileRepos>((ref) {
  final api = ref.watch(apiServicesProvider);
  return ProfileReposImpl(api);
});

final profileProvider = AsyncNotifierProvider<ProfileNotifier, ProfileResponse>(
  ProfileNotifier.new,
);
