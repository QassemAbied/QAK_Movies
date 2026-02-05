import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/features/details_movies/controller/details_movies_cubit.dart';
import 'package:untitled3/features/details_movies/controller/details_movies_state.dart';
import 'package:untitled3/features/details_movies/view/widgets/back_ground_image.dart';
import 'package:untitled3/features/details_movies/view/widgets/content_details_view.dart';
import 'package:untitled3/features/details_movies/view/widgets/shimmar_for_details_view.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 3,
          iconTheme: IconThemeData(color:context.colors.onSurface),
        ),
        body: BlocBuilder<DetailsMoviesCubit, DetailsMoviesState>(
          builder: (context, state) {
            return state.maybeWhen(
              detailsLoading: () {
                return const  DetailsShimmerLoading();
              },
              detailsError: (error) {
                return Center(child: Text(error));
              },
              detailsSuccess: (detailsMovies, credits, images, similar, video) {
                return Stack(
                  children: [
                    BackGroundImage(detailsMovies: detailsMovies),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      color: Colors.transparent,
                    ),
                    ContentDetailsView(
                      detailsMovies: detailsMovies,
                      images: images,
                      video: video,
                      credits: credits,
                      similar: similar,
                    ),
                  ],
                );
              },
              orElse: () {
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
