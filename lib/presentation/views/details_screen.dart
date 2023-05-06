import 'package:analyzer/dart/analysis/context_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/api.dart';
import 'package:untitled3/domain/entities/image_movie_entities.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorit_bloc.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorite_event.dart';
import 'package:untitled3/presentation/state_management/movie_details_bloc/details_bloc.dart';
import 'package:untitled3/presentation/state_management/movie_details_bloc/details_event.dart';
import 'package:untitled3/presentation/state_management/movie_details_bloc/details_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/di.dart';
import '../../domain/entities/cast_entities.dart';
import '../components/my_flutter_app_icons.dart';
import '../state_management/watchlist_bloc/watchlist_bloc.dart';
import '../state_management/watchlist_bloc/watchlist_event.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.id}) : super(key: key);
 final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (BuildContext context)=> Sl<MovieDetailsBloc>()
      ..add(DetailsEvent( id: widget.id))
      ..add(ImageForMovieEvent(widget.id))
      ..add(CastMovieEvent(widget.id))
      ..add(SimilarMovieEvent(widget.id))
      ..add(CheckAccountStatesEvent(widget.id))
    ..add(VideoMovieEvent(widget.id))),


        ],

      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context , state){
          final movies = state.detailsData;
          return  Scaffold(

            body: ConditionalBuilder(
              condition: state.detailsData !=null,
              builder: (context){
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildChedImage( item: movies,) ,
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text('Images For Movie',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    blurRadius:0.2,
                                    color: Colors.black,
                                    offset: Offset.fromDirection(100),
                                  ),
                                ],
                              ),),
                            const SizedBox(
                              height: 20.0,
                            ),
                            BuildImageMovie(state.imageMovieData,),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text('Cast For Movie',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    blurRadius:0.2,
                                    color: Colors.black,
                                    offset: Offset.fromDirection(100),
                                  ),
                                ],
                              ),),
                            const SizedBox(
                              height: 20.0,
                            ),
                            BuildCastMovie(state.castMovieData),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text('Similar Movie',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    blurRadius:0.2,
                                    color: Colors.black,
                                    offset: Offset.fromDirection(100),
                                  ),
                                ],
                              ),),
                            const SizedBox(
                              height: 20.0,
                            ),
                            SimilarMovie(state.similarMovieData, context),
                          ],
                        ),
                      ),

                    ],
                  ),

                );
              },
              fallback: (context){
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}


class BuildChedImage extends StatefulWidget {
  BuildChedImage({Key? key , required this.item}) : super(key: key);
  final MovieEntities? item;
  @override
  State<BuildChedImage> createState() => _BuildChedImageState();
}

class _BuildChedImageState extends State<BuildChedImage> {
   bool isMore = true;
   //bool isButton = true;
   @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: ConstanceApi.imagePath('${widget.item !=null? widget.item?.BackdropPath : ''}'),
              height:MediaQuery.of(context).size.height / 2 ,
              fit:  BoxFit.fill,
              width: double.infinity,
              imageBuilder: (context , ImageProvider){
                return Container(
                  height:MediaQuery.of(context).size.height / 2 ,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30) ),
                      image: DecorationImage(
                        image: ImageProvider,
                        //height:MediaQuery.of(context).size.height / 3 ,
                        fit:  BoxFit.fill,
                        // width: double.infinity,
                      )
                  ),

                );
              },
              errorWidget: (context , value , error){
              return Container(
                // width: double.infinity,
                // height:MediaQuery.of(context).size.height / 2 ,
                child: const Image(image: AssetImage('assets/image/no-pictures.png'),
                 // fit:  BoxFit.fill,

                ),
              );
            },
              placeholder:  (context , value ){
                return Container(
                  child: const Image(image: AssetImage('assets/image/86075-loading-upload-image.gif'),
                  ),
                );
              },
            ),
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context , state){
                return GestureDetector(
                  onTap: () async{
                    BlocProvider.of<MovieDetailsBloc>(context)..add(VideoMovieEvent(widget.item!.id));

                    final Uri _url = Uri.parse('https://www.youtube.com/embed/${state.video}');
                    if(! await launchUrl(_url)){
                      throw Exception('Could not launch ');
                    }



                  },
                  child: Icon(
                    Icons.play_circle_outline_outlined,
                    color: Colors.amberAccent,
                    size: 60,
                  ),
                );
              },

            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7, right: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text('${widget.item !=null?widget.item?.Title : ''}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
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
                height: 7.0,
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Release Date (${widget.item !=null?widget.item?.ReleaseDate : ''})'),
                      Text('Vote Count    (${widget.item !=null?widget.item?.VoteCount : ''})'),
                      Row(
                        children: [
                          Text('Vote Average '),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber,),
                              Text('${widget.item !=null?widget.item?.VoteAverage : ''}'),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                    builder: (context , state){
                    return   Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                //   print(widget.item?.id);
                              state.checkaccount!.watchlist==false?  BlocProvider.of<WatchlistBloc>(context)
                                  .add(AddWatchListItemEvent(
                                    media: MovieEntities(
                                      BackdropPath: widget.item!.BackdropPath,
                                      PosterPath: widget.item!.PosterPath,
                                      id: widget.item!.id,
                                      originalTitle: widget.item!.originalTitle,
                                      Overview: widget.item!.Overview,
                                      Popularity: widget.item!.Popularity,
                                      ReleaseDate: widget.item!.ReleaseDate,
                                      Title:widget. item!.Title,
                                      Video:widget. item!.Video,
                                      VoteAverage:widget. item!.VoteAverage,
                                      VoteCount: widget.item!.VoteCount, TrailerId: '', isFav: true,
                                    ),
                                  )):BlocProvider.of<WatchlistBloc>(context)
                                  .add(RemoveWatchListItemEvent(
                                media: MovieEntities(
                                  BackdropPath: widget.item!.BackdropPath,
                                  PosterPath: widget.item!.PosterPath,
                                  id: widget.item!.id,
                                  originalTitle: widget.item!.originalTitle,
                                  Overview: widget.item!.Overview,
                                  Popularity: widget.item!.Popularity,
                                  ReleaseDate: widget.item!.ReleaseDate,
                                  Title:widget. item!.Title,
                                  Video:widget. item!.Video,
                                  VoteAverage:widget. item!.VoteAverage,
                                  VoteCount: widget.item!.VoteCount, TrailerId: '', isFav: true,
                                ),
                              )) ;
                              },
                              icon: Icon(
                                Icons.bookmark,
                                color:  state.checkaccount?.watchlist==true ? Colors.red:Colors.black  ,
                                size: 40,
                              )),
                          IconButton(
                              onPressed: () {

                                state.checkaccount?.favorite==false?  BlocProvider.of<FavoritesBloc>(context)
                                    .add(AddFavoritesItemEvent(
                                  media: MovieEntities(
                                    BackdropPath: widget.item!.BackdropPath,
                                    PosterPath: widget.item!.PosterPath,
                                    id: widget.item!.id,
                                    originalTitle: widget.item!.originalTitle,
                                    Overview: widget.item!.Overview,
                                    Popularity: widget.item!.Popularity,
                                    ReleaseDate: widget.item!.ReleaseDate,
                                    Title:widget. item!.Title,
                                    Video:widget. item!.Video,
                                    VoteAverage:widget. item!.VoteAverage,
                                    VoteCount: widget.item!.VoteCount, TrailerId: '', isFav: true,  
                                  ),
                                ))
                                    :  BlocProvider.of<FavoritesBloc>(context)
                                    .add(RemoveFavoritesItemEvent(
                                  media: MovieEntities(
                                    BackdropPath: widget.item!.BackdropPath,
                                    PosterPath: widget.item!.PosterPath,
                                    id: widget.item!.id,
                                    originalTitle: widget.item!.originalTitle,
                                    Overview: widget.item!.Overview,
                                    Popularity: widget.item!.Popularity,
                                    ReleaseDate: widget.item!.ReleaseDate,
                                    Title:widget. item!.Title,
                                    Video:widget. item!.Video,
                                    VoteAverage:widget. item!.VoteAverage,
                                    VoteCount: widget.item!.VoteCount, TrailerId: '', isFav: true,
                                  ),
                                ));

                              },
                              icon: Icon(
                                Icons.favorite,
                                color: state.checkaccount?.favorite==true ? Colors.red:Colors.black ,
                                size: 40,
                              )),
                        ],
                      );
                    },

                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('About the Movie',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
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
                height: 20.0,
              ),
              Text('${widget.item !=null?widget.item?.Overview : ''}',
                maxLines: isMore==true ?3 : 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
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
              Center(
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        isMore ==false;
                        isMore =!isMore;
                      });
                    },
                    child: Text(isMore== true?'See More' : 'See Less ', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      shadows: [
                        Shadow(
                          blurRadius:0.2,
                          color: Colors.blue,
                          offset: Offset.fromDirection(100),
                        ),
                      ],
                    ),)),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

Widget BuildImageMovie(List<ImageMovieEntities> moviees){

  return Container(
    width: double.infinity,
    height:200 ,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          final itemes = moviees[index];
          return CachedNetworkImage(
              imageUrl: ConstanceApi.imagePath(itemes.images),
            height: 200,
            width: 150,
            fit: BoxFit.fill,
            imageBuilder: (context , imageProvider){
                return Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,

                    )
                  ),
                );
            },
            placeholder:  (context , value ){
              return Container(
                child: const Image(image: AssetImage('assets/image/86075-loading-upload-image.gif'),
                ),
              );
            },
          );
        },
        separatorBuilder: (context , index){
          return SizedBox(
            width: 10.0,
          );
        },
        itemCount:moviees.length ,
    ),
  );
}

Widget  BuildCastMovie(List<CastEntities> cast){
  return Container(
    height: 150,
    width: double.infinity,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
        final item = cast[index];
          return Column(
            children: [
              CachedNetworkImage(
                  imageUrl: ConstanceApi.imagePath('${item !=null ? item.profile_path : ''}'),
                height: 110,
                width: 130,
                fit: BoxFit.fill,
                imageBuilder: (context , imageProvider){
                    return Container(
                      height: 110,
                      width: 130,
                      decoration:BoxDecoration(
                       // borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black , width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                         fit: BoxFit.fill,
                        ),
                      ) ,
                    );
                },
                errorWidget: (context , value , child){
                    return Container(
                      height: 110,
                      width: 130,
                      child: Image(image: AssetImage('assets/image/no-pictures.png')),
                    );
                },
                placeholder:  (context , value ){
                  return Container(
                    child: const Image(image: AssetImage('assets/image/86075-loading-upload-image.gif'),
                    ),
                  );
                },
              ),
              Text(item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius:0.2,
                      color: Colors.black,
                      offset: Offset.fromDirection(100),
                    ),
                  ],
                ),),
            ],
          );
        },
        separatorBuilder: (context , index){
          return SizedBox(
            width: 10.0,
          );
        },
        itemCount: cast.length,
    ),
  );
}

Widget SimilarMovie(List<MovieEntities> movie, context){
  return Container(
    // width: double.infinity,
    // height: double.infinity,
    child:movie.isNotEmpty? GridView.count(
      physics: BouncingScrollPhysics(),
        crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      scrollDirection: Axis.vertical,
      // reverse: true,
       shrinkWrap: true,
      childAspectRatio: 0.7,

      children: List.generate(movie.length,
              (index) {
        final item = movie[index];
        return  GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(id: item.id)));
          },
          child: Container(
            width: 150,
            height: 150,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CachedNetworkImage(
                  imageUrl: ConstanceApi.imagePath(item.BackdropPath),
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                  imageBuilder: (context , imageProvider){
                    return Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,

                          )
                      ),
                    );
                  },
                  placeholder:  (context , value ){
                    return Container(
                      child: const Image(image: AssetImage('assets/image/86075-loading-upload-image.gif'),
                      ),
                    );
                  },
                  errorWidget: (context , value , child){
                    return Container(
                      height: 110,
                      width: 130,
                      child: Image(image: AssetImage('assets/image/no-pictures.png')),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3 , right: 3),
                  child: Text(item.Title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius:0.3,
                          color: Colors.black,
                          offset: Offset.fromDirection(100),
                        ),
                      ],
                    ),),
                ),
              ],
            ),
          ),
        );
              }),
    ):Container(
      child: Center(
        child: Row(
          children: [
            Text('Not Found Data',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                shadows: [
                  Shadow(
                    blurRadius:0.2,
                    color: Colors.black,
                    offset: Offset.fromDirection(100),
                  ),
                ],
              ),),
            Container(
              width: 150,
                height: 150,
                child: Image(image: AssetImage('assets/image/104878-data-not-found (1).gif'))),
          ],
        ),
      ),
    ),
  );
}

