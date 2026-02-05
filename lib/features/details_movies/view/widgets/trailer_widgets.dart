import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/models/video_response.dart';

class TrailerWidgets extends StatelessWidget {
  const TrailerWidgets({super.key, this.video, this.imageUrl});
  final VideoResponses? video;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final trailer = video?.results
        ?.where((e) => e.type == "Trailer" && e.site == "YouTube")
        .toList()
        .firstOrNull;
    return trailer != null
        ? GestureDetector(
            onTap: () {
              showTrailerBottomSheet(context, trailer.key ?? '');
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl ?? "",
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  void showTrailerBottomSheet(BuildContext context, String videoId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return SizedBox(
                height: orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * 0.35
                    : MediaQuery.of(context).size.height,
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videoId,
                      flags: const YoutubePlayerFlags(
                        autoPlay: true,
                        mute: false,
                        forceHD: true,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                  builder: (context, player) {
                    return player;
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
