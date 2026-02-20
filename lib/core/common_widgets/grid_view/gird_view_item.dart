import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../features/home/data/models/movies_response_models.dart';
import '../../helpers/extension.dart';
import '../../helpers/spacing.dart';
import '../../network/api_constance.dart';
import '../../routing/routers.dart';
import '../../theming/app_text_style.dart';
import '../add_favorites_icon.dart';
import '../add_watch_list_icon.dart';

class GirdViewItem extends StatelessWidget {
  const GirdViewItem({super.key, required this.result, required this.index});
  final List<MovieModel> result;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.detailsMoviesScreen,
          arguments: result[index].id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: index % 4 == 0 ? 260 : 290,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: context.colors.surface.withValues(alpha: 0.8),
                  boxShadow: [
                    BoxShadow(color: context.colors.onSurface, blurRadius: 5),
                    BoxShadow(
                      color: context.colors.onSurfaceVariant,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddFavoritesIcon(
                      id: result[index].id!,
                      model: result[index],
                    ),
                    AddWatchListIcon(
                      id: result[index].id!,
                      model: result[index],
                    ),
                  ],
                ),
              ),
              Expanded(
                // flex: 4,
                child: CachedNetworkImage(
                  memCacheWidth: 400,
                  memCacheHeight: 600,
                  imageUrl: ApiConstance.imagePath(
                    result[index].posterPath ?? '',
                  ),
                  width: double.infinity,
                  fit: BoxFit.fill,

                  placeholder: (context, url) => Image.asset(
                    'assets/image/86075-loading-upload-image.gif',
                    fit: BoxFit.fill,
                  ),

                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: const Icon(Icons.broken_image),
                  ),
                  imageBuilder: (context, imageProvider) => Container(
                    // width: widthForImage,
                    // height: heightForImage,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.onSurface,
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          color: context.colors.onSurfaceVariant,
                          blurRadius: 5,
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),

                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Image(image: imageProvider, fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              verticalSpace(5),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    result[index].title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.medium(
                      context,
                      size: 17,
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
