import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/core/theming/app_colors.dart';
import 'package:untitled3/core/theming/app_text_style.dart';
import '../../../../core/network/api_constance.dart';
import '../../data/models/movies_response_models.dart';

class CarouselWidget extends StatelessWidget {
  final List<MovieModel> trend;
  const CarouselWidget({super.key, required this.trend});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(trend.length, (index) {
        final itemPopular = trend[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.7),
                    AppColors.darkCard.withValues(alpha: 0.20),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.14, 0.4],
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
                      itemPopular.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTextStyles.bold(
                            context,
                            size: 25,
                            color:context.colors.onSurface
                          ).copyWith(
                            shadows: [
                              Shadow(
                                blurRadius: 0.2,
                                color:context.colors.surfaceContainerHigh,
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
                          color: AppColors.darkBackground,
                        ).copyWith(
                          shadows: [
                            Shadow(
                              blurRadius: 0.2,
                              color: AppColors.darkTextPrimary,
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
