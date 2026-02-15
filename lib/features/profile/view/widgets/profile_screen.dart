import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import '../../../providers.dart';

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

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final profile = ref.watch(profileProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: profile.when(
        data: (prof) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    prof.avatar != null
                        ? "https://www.gravatar.com/avatar/${profile.hashCode}"
                        : "https://i.imgur.com/BoN9kdC.png",
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  prof.username ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (prof.name!.isNotEmpty)
                  Text(prof.name ?? '', style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 20),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text("Language"),
                    subtitle: Text(getLanguageName(prof.iso6391 ?? '')),
                  ),
                ),
                verticalSpace(20),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.flag),
                    title: const Text("Country"),
                    subtitle: Text(getCountryName(prof.iso31661 ?? '')),
                  ),
                ),
              ],
            ),
          );
        },
        error: (e, _) {
          return Center(child: Text(e.toString() ?? ''));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
