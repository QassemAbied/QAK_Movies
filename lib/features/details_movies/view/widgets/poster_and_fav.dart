import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/core/common_widgets/add_favorites_icon.dart';
import 'package:untitled3/core/common_widgets/add_watch_list_icon.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../../home/data/models/movies_response_models.dart';
import '../../data/models/details_movies_response.dart';

class PosterAndFav extends StatelessWidget {
  const PosterAndFav({super.key, this.detailsMovies});
  final DetailsMoviesResponse? detailsMovies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detailsMovies?.title ?? '',
          style: AppTextStyles.bold(
            context,
            size: 25,
            color: context.colors.onSurface,
          ),
        ),
        verticalSpace(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: detailsMovies?.id ?? 0,
              child: CachedNetworkImage(
                imageUrl: ApiConstance.imagePath(
                  detailsMovies?.posterPath ?? '',
                ),
                width: 150,
                height: MediaQuery.sizeOf(context).height * 0.3,
                fit: BoxFit.contain,

                placeholder: (context, url) => SizedBox(
                  width: 150,
                  child: Image.asset(
                    'assets/image/86075-loading-upload-image.gif',
                    fit: BoxFit.cover,
                  ),
                ),

                errorWidget: (context, url, error) => Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: const Icon(Icons.broken_image),
                ),

                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: context.colors.onSurface, blurRadius: 5),
                      BoxShadow(
                        color: context.colors.onSurfaceVariant,
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            horizontalSpace(20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${detailsMovies?.releaseDate?.substring(0, 4) ?? ''}, ${detailsMovies?.genres!.map((e) => e.name).join(', ').toString() ?? ''}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bold(
                      context,
                      size: 18,
                      color: context.colors.onSurface,
                    ),
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: context.colors.primary,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            detailsMovies?.voteAverage?.toStringAsFixed(1) ??
                                '',
                            style: AppTextStyles.bold(
                              context,
                              size: 20,
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(10),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: context.colors.primary,
                            width: 2,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            detailsMovies?.originalLanguage?.toUpperCase() ??
                                '',
                            style: AppTextStyles.bold(
                              context,
                              size: 20,
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(10),
                      AddFavoritesIcon(
                        id: detailsMovies?.id ?? 0,
                        model: MovieModel.fromDetails(detailsMovies!),
                      ),
                      horizontalSpace(10),
                      AddWatchListIcon(
                        id: detailsMovies?.id ?? 0,
                        model: MovieModel.fromDetails(detailsMovies!),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Text(
                    S.of(context).Status,
                    style: AppTextStyles.semiBold(
                      context,
                      size: 16,
                      color: context.colors.onSurface,
                    ),
                  ),
                  // verticalSpace(10),
                  Text(
                    detailsMovies?.status ?? '',
                    style: AppTextStyles.semiBold(
                      context,
                      size: 18,
                      color: context.colors.primary,
                    ),
                  ),
                  verticalSpace(10),
                  Text(
                    S.of(context).Revenue,
                    style: AppTextStyles.semiBold(
                      context,
                      size: 16,
                      color: context.colors.onSurface,
                    ),
                  ),
                  // verticalSpace(10),
                  Text(
                    '\$${detailsMovies?.revenue?.toInt().toString() ?? '0'}',
                    style: AppTextStyles.semiBold(
                      context,
                      size: 18,
                      color: context.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
