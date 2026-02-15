import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/network/api_result.dart';
import '../../providers.dart';
import '../data/models/profile_response.dart';
import '../data/repos/profile_repos.dart';

class ProfileNotifier extends AsyncNotifier<ProfileResponse> {
  ProfileRepos get _repo => ref.read(profileRepoProvider);
  @override
  Future<ProfileResponse> build() async {
    final response = await _repo.getProfile();
    return response.when(
      success: (data) => data,
      failure: (error) => throw error,
    );
  }
}
