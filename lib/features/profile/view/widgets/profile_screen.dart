import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/features/profile/controller/profile_cubit.dart';
import 'package:untitled3/features/profile/controller/profile_state.dart';

String getCountryName(String code) {
  switch (code) {
    case "EG":
      return "Egypt";
    case "US":
      return "United States";
    default:
      return code;
  }
}

String getLanguageName(String code) {
  switch (code) {
    case "ar":
      return "Arabic";
    case "en":
      return "English";
    default:
      return code;
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            error: (e) {
              return Center(child: Text(e ?? ''));
            },
            success: (profile) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        profile.avatar != null
                            ? "https://www.gravatar.com/avatar/${profile.hashCode}"
                            : "https://i.imgur.com/BoN9kdC.png",
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      profile.username ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    if (profile.name!.isNotEmpty)
                      Text(
                        profile.name ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),

                    const SizedBox(height: 20),

                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text("Language"),
                        subtitle: Text(getLanguageName(profile.iso6391 ?? '')),
                      ),
                    ),
                    verticalSpace(20),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.flag),
                        title: const Text("Country"),
                        subtitle: Text(getCountryName(profile.iso31661 ?? '')),
                      ),
                    ),
                  ],
                ),
              );
            },

            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
