import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/features/details_movies/view/widgets/back_ground_image.dart';
import 'package:untitled3/features/details_movies/view/widgets/content_details_view.dart';
import 'package:untitled3/features/details_movies/view/widgets/shimmar_for_details_view.dart';
import 'package:untitled3/features/providers.dart';

import '../data/models/details_params.dart';

class DetailsScreen extends StatelessWidget {
 const  DetailsScreen({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final params = DetailsParams(movieId: movieId, language: 'en');
    log('messageBuild');
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 3,
          iconTheme: IconThemeData(color:context.colors.onSurface),
        ),
        body:Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final detailsRef= ref.watch(detailsProvider(params,));


          return detailsRef.when(
              data: (detailsData){
                return Stack(
                  children: [
                    BackGroundImage(detailsMovies: detailsData.details),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      color: Colors.transparent,
                    ),
                    ContentDetailsView(
                      detailsMovies: detailsData.details,
                      images: detailsData.backdrops,
                      video: detailsData.videos,
                      credits: detailsData.cast,
                      similar: detailsData.similarMovies,
                    ),
                  ],
                );
              },
              error: (error,_) {
                return Center(child: Text(error.toString()));
              },
              loading: (){
                return const  DetailsShimmerLoading();
              }
          );
        },

        ),





      ),
    );
  }
}
