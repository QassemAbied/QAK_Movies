import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/api.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import 'package:untitled3/presentation/views/details_screen.dart';

import '../../core/di.dart';
import '../state_management/favorite_bloc/favorit_bloc.dart';
import '../state_management/favorite_bloc/favorite_event.dart';
import '../state_management/movie_details_bloc/details_bloc.dart';
import '../state_management/movie_details_bloc/details_event.dart';
import '../state_management/movie_details_bloc/details_state.dart';
import '../state_management/watchlist_bloc/watchlist_bloc.dart';
import '../state_management/watchlist_bloc/watchlist_event.dart';

class BuildListViewScreen extends StatefulWidget {
  const BuildListViewScreen({Key? key ,required this.movie, required this.appbarText }) : super(key: key);
 final List<MovieEntities> movie;
  final String appbarText;

  @override
  State<BuildListViewScreen> createState() => _BuildListViewScreenState();
}

class _BuildListViewScreenState extends State<BuildListViewScreen> {
  bool ChanColors= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(widget.appbarText,style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          shadows: [
            Shadow(
              blurRadius:0.2,
              color: Colors.blueGrey.shade400,
              offset: Offset.fromDirection(100),
            ),
          ],
        ),),
      ),

      body:ConditionalBuilder(
        condition:widget.movie .isNotEmpty,
        builder: (context){
          return  SingleChildScrollView(
            child:Padding(
              padding: const EdgeInsets.only(top:6, bottom:6,left: 6, right: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      final item = widget.movie[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(id: item.id,)));
                        },
                        child: Card(
                          color: Colors.white38,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: ConstanceApi.imagePath(item.PosterPath),
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.fill,
                                  errorWidget: (context ,child, error){
                                    return  Container(
                                      height: 150,
                                      width: 150,
                                      child: const Image(image: AssetImage('assets/image/no-pictures.png'),
                                      ),
                                    );
                                  },
                                  placeholder:  (context , value ){
                                    return Container(
                                      height: 150,
                                      width: 150,
                                      child: const Image(image: AssetImage('assets/image/86075-loading-upload-image.gif'),
                                      ),
                                    );
                                  },
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5 , right: 5 , left:  5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(item.Title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            shadows: [
                                              Shadow(
                                                blurRadius:0.2,
                                                color: Colors.black,
                                                offset: Offset.fromDirection(100),
                                              ),
                                            ],
                                          ),),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(item.Overview,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                            shadows: [
                                              Shadow(
                                                blurRadius:0.2,
                                                color: Colors.black,
                                                offset: Offset.fromDirection(100),
                                              ),
                                            ],
                                          ),),
                                        SizedBox(
                                          height: 5,
                                        ),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: List.generate(5, (index) {
                                                  return Icon(Icons.star,size: 20,
                                                    color:item.VoteAverage /2< index?Colors.black45: Colors.amber,
                                                  );
                                                }),
                                              ),
                                            ),
                                            Text('(${item.VoteAverage.ceil() /2})'),
                                          ],
                                        ),

                                        Expanded(
                                          child: BlocProvider(
                                            create: (BuildContext context)=> Sl<MovieDetailsBloc>()
                                              ..add(CheckAccountStatesEvent(item.id , )),
                                            child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                                              builder: (context , state){
                                                return Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                      onPressed: (){

                                                        state.checkaccount!.watchlist==false?  BlocProvider.of<WatchlistBloc>(context)
                                                            .add(AddWatchListItemEvent(
                                                          media: MovieEntities(
                                                            BackdropPath: item.BackdropPath,
                                                            PosterPath: item.PosterPath,
                                                            id: item.id,
                                                            originalTitle: item.originalTitle,
                                                            Overview: item.Overview,
                                                            Popularity: item.Popularity,
                                                            ReleaseDate: item.ReleaseDate,
                                                            Title: item.Title,
                                                            Video: item.Video,
                                                            VoteAverage: item.VoteAverage,
                                                            VoteCount: item.VoteCount, TrailerId: '', isFav: true,
                                                          ),
                                                        )):BlocProvider.of<WatchlistBloc>(context)
                                                            .add(RemoveWatchListItemEvent(
                                                          media: MovieEntities(
                                                            BackdropPath: item.BackdropPath,
                                                            PosterPath:item.PosterPath,
                                                            id: item.id,
                                                            originalTitle: item.originalTitle,
                                                            Overview: item.Overview,
                                                            Popularity:item.Popularity,
                                                            ReleaseDate: item.ReleaseDate,
                                                            Title: item.Title,
                                                            Video: item.Video,
                                                            VoteAverage: item.VoteAverage,
                                                            VoteCount: item.VoteCount, TrailerId: '', isFav: true,
                                                          ),
                                                        )) ;
                                                      },
                                                      icon: Icon(Icons.bookmark,

                                                        color:  state.checkaccount?.watchlist==true ? Colors.red:Colors.black  ,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: (){
                                                        state.checkaccount?.favorite==false?  BlocProvider.of<FavoritesBloc>(context)
                                                            .add(AddFavoritesItemEvent(
                                                          media: MovieEntities(
                                                            BackdropPath: item.BackdropPath,
                                                            PosterPath:item.PosterPath,
                                                            id: item.id,
                                                            originalTitle: item.originalTitle,
                                                            Overview: item.Overview,
                                                            Popularity:item.Popularity,
                                                            ReleaseDate: item.ReleaseDate,
                                                            Title: item.Title,
                                                            Video: item.Video,
                                                            VoteAverage: item.VoteAverage,
                                                            VoteCount: item.VoteCount, TrailerId: '', isFav: true,
                                                          ),
                                                        ))
                                                            :  BlocProvider.of<FavoritesBloc>(context)
                                                            .add(RemoveFavoritesItemEvent(
                                                          media: MovieEntities(
                                                            BackdropPath: item.BackdropPath,
                                                            PosterPath:item.PosterPath,
                                                            id: item.id,
                                                            originalTitle: item.originalTitle,
                                                            Overview: item.Overview,
                                                            Popularity:item.Popularity,
                                                            ReleaseDate: item.ReleaseDate,
                                                            Title: item.Title,
                                                            Video: item.Video,
                                                            VoteAverage: item.VoteAverage,
                                                            VoteCount: item.VoteCount, TrailerId: '', isFav: true,
                                                          ),
                                                        ));

                                                      },
                                                      icon: Icon(Icons.favorite,
                                                        color:  state.checkaccount?.favorite==true ? Colors.red:Colors.black  ,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index)
                    {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: widget.movie.length,
                  ),
                ],
              ),
            ) ,
          );
        },
        fallback: (context){
          return Center(child: CircularProgressIndicator());
        },
      ),

    );
  }
}


