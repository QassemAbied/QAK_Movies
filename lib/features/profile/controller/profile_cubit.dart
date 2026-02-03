import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/profile/controller/profile_state.dart';
import 'package:untitled3/features/profile/data/repos/profile_repos.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepos profileRepos;
  ProfileCubit(this.profileRepos) : super(const ProfileState.initial());

  loadProfile() async {
    emit(const ProfileState.loading());

    final response = await profileRepos.getProfile();
    response.when(
      success: (profileResponse) {
        emit(ProfileState.success(profileResponse: profileResponse));
      },
      failure: (e) {
        emit(ProfileState.error(error: e.message ?? ''));
      },
    );
  }
}
