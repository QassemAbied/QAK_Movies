import 'package:flutter/material.dart';
import 'package:untitled3/features/details_movies/view/widgets/poster_and_fav.dart';
import 'package:untitled3/features/details_movies/view/widgets/title_and_overview.dart';
import 'package:untitled3/features/details_movies/view/widgets/trailer_widgets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/network/api_constance.dart';
import '../../../home/data/models/movies_response_models.dart';
import '../../data/models/credits_response.dart';
import '../../data/models/details_movies_response.dart';
import '../../data/models/images_movies_response.dart';
import '../../data/models/video_response.dart';
import 'lists_for_detalis.dart';

class ContentDetailsView extends StatelessWidget {
  const ContentDetailsView({
    super.key,
    this.video,
    this.credits,
    this.images,
    this.similar,
    this.detailsMovies,
  });
  final VideoResponses? video;
  final CreditsResponse? credits;
  final ImagesMoviesResponse? images;
  final MoviesResponse? similar;
  final DetailsMoviesResponse? detailsMovies;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PosterAndFav(detailsMovies: detailsMovies),
                TitleAndOverview(detailsMovies: detailsMovies),
                if (video?.results != null) ...[
                  TrailerWidgets(
                    video: video,
                    imageUrl: ApiConstance.imagePath(
                      detailsMovies?.backdropPath ?? '',
                    ),
                  ),
                  verticalSpace(10),
                ],
                ListsForDetails(
                  images: images,
                  credits: credits,
                  similar: similar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
