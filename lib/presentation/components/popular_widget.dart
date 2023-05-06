import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/api.dart';
//import 'package:untitled3/domain/entities/media_detail.dart';
import 'package:untitled3/domain/entities/movie.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import 'package:untitled3/domain/use_case/watchlist_use_case/add_watchlist_usecase.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_bloc.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_state.dart';
import 'package:untitled3/presentation/state_management/watchlist_bloc/watchlist_bloc.dart';
import 'package:untitled3/presentation/state_management/watchlist_bloc/watchlist_event.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/di.dart';
import '../state_management/movie_bloc/movie_event.dart';
import '../state_management/movie_details_bloc/details_bloc.dart';
import '../state_management/movie_details_bloc/details_event.dart';
import '../state_management/movie_details_bloc/details_state.dart';
import 'no_video_screen.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    Key? key,
  }) : super(key: key);
//final List<MovieEntities> movielist;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return Container(
          height: 300,
          width: double.infinity,
          child: CarouselSlider(
            items: List.generate(state.popularData.length, (index) {
              final item = state.popularData[index];
              //final item = movielist[index];
              return Stack(
                children: [
                  Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: ConstanceApi.imagePath(item.BackdropPath),
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 300,
                        placeholder: (context, value) {
                          return Container(
                            child: const Image(
                              image: AssetImage(
                                  'assets/image/86075-loading-upload-image.gif'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  BlocProvider(
                    create: (context)=> Sl<MovieDetailsBloc>()..add(VideoMovieEvent(item.id)),
                    child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                      builder: (context , state){
                        return GestureDetector(
                          onTap: () async{
                            if(state.video!.isNotEmpty){
                              BlocProvider.of<MovieDetailsBloc>(context)..add(VideoMovieEvent(item.id));

                              final Uri _url = Uri.parse('https://www.youtube.com/embed/${state.video}');
                              if(! await launchUrl(_url)){
                                throw Exception('Could not launch ');
                              }
                            }else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NoVideoScreen()));
                            }



                          },
                          child: Center(
                            child: Icon(
                              Icons.play_circle_outline_outlined,
                              color: Colors.amberAccent,
                              size: 60,
                            ),
                          ),
                        );
                      },

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.originalTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 0.2,
                                color: Colors.black,
                                offset: Offset.fromDirection(100),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          item.ReleaseDate,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 0.2,
                                color: Colors.black,
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
              height: 300,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayCurve: Curves.linearToEaseOut,
              autoPlayAnimationDuration: Duration(seconds: 3),
              scrollDirection: Axis.horizontal,
            ),
          ),
        );
      },
    );
  }
}
