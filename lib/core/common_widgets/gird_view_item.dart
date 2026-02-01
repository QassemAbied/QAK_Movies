import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/favorites/controller/favorites_cubit.dart';
import '../../features/favorites/data/models/add_favorite_request.dart';
import '../../features/home/data/models/movies_response_models.dart';
import '../helpers/extension.dart';
import '../helpers/spacing.dart';
import '../network/api_constance.dart';
import '../routing/routers.dart';
import '../theming/app_text_style.dart';

class GirdViewItem extends StatelessWidget {
  const GirdViewItem({super.key, required this.result, required this.index});
  final List<MovieModel> result;
  final int index;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        context.pushNamed(Routes.detailsMoviesScreen,
            arguments: result[index].id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: index % 4 == 0 ? 240 : 280,
            child: Stack(
              children: [
                CachedNetworkImage(
                  memCacheWidth: 400,
                  memCacheHeight: 600,
                  imageUrl: ApiConstance.imagePath(
                      result[index].posterPath ?? ''),
                  // height: index % 4 == 0 ? 220 : 260,
                  fit: BoxFit.cover,

                  placeholder: (context, url) => Image.asset(
                    'assets/image/86075-loading-upload-image.gif',
                    fit: BoxFit.cover,
                  ),

                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: const Icon(Icons.broken_image),
                  ),

                  imageBuilder: (context, imageProvider) =>
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //context.read<FavoritesCubit>().isFavorite==true;

                        context.read<FavoritesCubit>().removeFavorite(
                          request: AddFavoriteRequest(
                            "movie",
                            result[index].id ?? 0,
                            false,
                          ),
                        );

                      },
                      child: const Icon(
                        Icons.favorite,
                        color:  Colors.red ,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(5),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                result[index].originalTitle ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.medium(
                  context,
                  size: 15,
                  color: context.colors.onSurface,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
