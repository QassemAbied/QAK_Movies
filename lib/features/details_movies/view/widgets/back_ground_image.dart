import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/network/api_constance.dart';
import '../../data/models/details_movies_response.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key, this.detailsMovies});
  final DetailsMoviesResponse? detailsMovies;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: ApiConstance.imagePath(detailsMovies?.backdropPath ?? ''),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      fit: BoxFit.cover,
    );
  }
}
