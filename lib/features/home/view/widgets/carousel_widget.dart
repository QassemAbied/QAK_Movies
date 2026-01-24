import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/core/thiming/app_colors.dart';
import 'package:untitled3/core/thiming/app_text_style.dart';
import '../../../../core/network/api_constance.dart';
import '../../data/models/movies_response_models.dart';

class CarouselWidget extends StatelessWidget {
  final List<MovieModel> popular;
  const CarouselWidget({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(popular.length, (index) {
        final itemPopular = popular[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.textPrimary.withValues(alpha: 0.7),
                    AppColors.bgDark.withValues(alpha: 0.20),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.14, 0.4],
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: ApiConstance.imagePath(itemPopular.backdropPath),
                fit: BoxFit.cover,
                placeholder: (context, value) {
                  return Container(
                    child: const Image(
                      image: AssetImage(
                        'assets/image/86075-loading-upload-image.gif',
                      ),
                    ),
                  );
                },
              ),
            ),

            // BlocProvider(
            //   create: (context) =>
            //       Sl<MovieDetailsBloc>()..add(VideoMovieEvent(item.id)),
            //   child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            //     builder: (context, state) {
            //       return GestureDetector(
            //         onTap: () async {
            //           if (state.video!.isNotEmpty) {
            //             BlocProvider.of<MovieDetailsBloc>(context)
            //               ..add(VideoMovieEvent(item.id));
            //
            //             final Uri _url = Uri.parse(
            //                 'https://www.youtube.com/embed/${state.video}');
            //             if (!await launchUrl(_url)) {
            //               throw Exception('Could not launch ');
            //             }
            //           } else {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => NoVideoScreen()));
            //           }
            //         },
            //         child: Center(
            //           child: Icon(
            //             Icons.play_circle_outline_outlined,
            //             color: Colors.amberAccent,
            //             size: 60,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text(
                      itemPopular.originalTitle ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTextStyles.bold(
                            context,
                            size: 25,
                            color: AppColors.textPrimary,
                          ).copyWith(
                            shadows: [
                              Shadow(
                                blurRadius: 0.2,
                                color: AppColors.bgDark,
                                offset: Offset.fromDirection(100),
                              ),
                            ],
                          ),
                    ),
                  ),
                  Text(
                    itemPopular.releaseDate ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        AppTextStyles.bold(
                          context,
                          size: 18,
                          color: AppColors.bgDeepNavy,
                        ).copyWith(
                          shadows: [
                            Shadow(
                              blurRadius: 0.2,
                              color: AppColors.textPrimary,
                              offset: Offset.fromDirection(100),
                            ),
                          ],
                        ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
      options: CarouselOptions(
        enlargeCenterPage: false,
        enableInfiniteScroll: true,
        // autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        autoPlayCurve: Curves.easeInBack,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
