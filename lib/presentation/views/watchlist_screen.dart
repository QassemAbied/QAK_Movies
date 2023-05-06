import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/data/modules/movie_modules.dart';
import '../../core/api.dart';
import '../../core/di.dart';
import '../../domain/entities/movie_entities.dart';
import '../components/empty_text.dart';
import '../components/error_screen.dart';
import '../components/list_view_viertical.dart';
import '../state_management/favorite_bloc/favorit_bloc.dart';
import '../state_management/favorite_bloc/favorite_event.dart';
import '../state_management/movie_details_bloc/details_bloc.dart';
import '../state_management/movie_details_bloc/details_event.dart';
import '../state_management/movie_details_bloc/details_state.dart';
import '../state_management/watchlist_bloc/watchlist_bloc.dart';
import '../state_management/watchlist_bloc/watchlist_event.dart';
import '../state_management/watchlist_bloc/watchlist_state.dart';
import 'details_screen.dart';

class WatchlistView extends StatelessWidget {
  WatchlistView({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'WatchList',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                shadows: [
                  Shadow(
                    blurRadius: 0.2,
                    color: Colors.blueGrey.shade400,
                    offset: Offset.fromDirection(100),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state.items.isNotEmpty   ,
            builder: (context) {
              return BuildWatchListItems(
                movie: state.items,
              );
            },
            fallback: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}

class BuildWatchListItems extends StatefulWidget {
  const BuildWatchListItems({Key? key, required this.movie}) : super(key: key);
  final List<MovieEntities> movie;
  @override
  State<BuildWatchListItems> createState() => _BuildWatchListItemsState();
}

class _BuildWatchListItemsState extends State<BuildWatchListItems> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           widget.movie.isNotEmpty? ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = widget.movie[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  id: item.id,
                                )));
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
                            errorWidget: (context, child, error) {
                              return Container(
                                height: 150,
                                width: 150,
                                child: const Image(
                                  image: AssetImage(
                                      'assets/image/no-pictures.png'),
                                ),
                              );
                            },
                            placeholder: (context, value) {
                              return Container(
                                height: 150,
                                width: 150,
                                child: const Image(
                                  image: AssetImage(
                                      'assets/image/86075-loading-upload-image.gif'),
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 5, left: 5, bottom: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.Title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 0.2,
                                          color: Colors.black,
                                          offset: Offset.fromDirection(100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text(
                                    item.Overview,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 0.2,
                                          color: Colors.black,
                                          offset: Offset.fromDirection(100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: List.generate(5, (index) {
                                            return Icon(
                                              Icons.star,
                                              size: 20,
                                              color:
                                                  item.VoteAverage / 2 < index
                                                      ? Colors.black45
                                                      : Colors.amber,
                                            );
                                          }),
                                        ),
                                      ),
                                      Text('(${item.VoteAverage.ceil() / 2})'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: BlocProvider(
                                      create: (context) => Sl<
                                          MovieDetailsBloc>()
                                        ..add(CheckAccountStatesEvent(item.id)),
                                      child: BlocBuilder<MovieDetailsBloc,
                                          MovieDetailsState>(
                                        builder: (context, state) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    //   print(widget.item?.id);
                                                    BlocProvider.of<
                                                        FavoritesBloc>(context)
                                                      ..add(
                                                          AddFavoritesItemEvent(
                                                        media: MovieEntities(
                                                          BackdropPath:
                                                              item.BackdropPath,
                                                          PosterPath:
                                                              item.PosterPath,
                                                          id: item.id,
                                                          originalTitle: item
                                                              .originalTitle,
                                                          Overview:
                                                              item.Overview,
                                                          Popularity:
                                                              item.Popularity,
                                                          ReleaseDate:
                                                              item.ReleaseDate,
                                                          Title: item.Title,
                                                          Video: item.Video,
                                                          VoteAverage:
                                                              item.VoteAverage,
                                                          VoteCount:
                                                              item.VoteCount,
                                                          TrailerId: '',
                                                          isFav: true,
                                                        ),
                                                      ));
                                                  },
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: state.checkaccount
                                                                ?.favorite ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.black,
                                                    size: 25,
                                                  )),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.black),
                                                ),
                                                onPressed: () {
                                                  BlocProvider.of<
                                                      WatchlistBloc>(context)
                                                    ..add(
                                                        RemoveWatchListItemEvent(
                                                      media: MovieEntities(
                                                          BackdropPath:
                                                              item.BackdropPath,
                                                          PosterPath:
                                                              item.PosterPath,
                                                          id: item.id,
                                                          originalTitle: item
                                                              .originalTitle,
                                                          Overview:
                                                              item.Overview,
                                                          Popularity:
                                                              item.Popularity,
                                                          ReleaseDate:
                                                              item.ReleaseDate,
                                                          Title: item.Title,
                                                          Video: item.Video,
                                                          VoteAverage:
                                                              item.VoteAverage,
                                                          VoteCount:
                                                              item.VoteCount,
                                                          TrailerId: '',
                                                          isFav: true),
                                                    ));
                                                  setState(() {
                                                    widget.movie
                                                        .removeAt(index);
                                                  });
                                                },
                                                child: Text(
                                                  'Remove',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  )
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
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: widget.movie.length,
            ):Container(
        width: double.infinity,

        child:  Center(
          child: Text('Not Found Data In WatchList',
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
        ),
      ),
          ],
        ),
      ),
    );
  }
}




// Widget BuildWatchListView(  List<MovieEntities> movie){
//
//   return SingleChildScrollView(
//     child:Padding(
//       padding: const EdgeInsets.only(top:6, bottom:6,left: 6, right: 6),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListView.separated(
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index){
//               final item = movie[index];
//               return GestureDetector(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(id: item.id,)));
//                 },
//                 child: Card(
//                   color: Colors.white38,
//                   child: Container(
//                     width: double.infinity,
//                     height: 150,
//                     child: Row(
//                       children: [
//                         CachedNetworkImage(
//                           imageUrl: ConstanceApi.imagePath(item.PosterPath),
//                           height: 150,
//                           width: 150,
//                           fit: BoxFit.fill,
//                           errorWidget: (context ,child, error){
//                             return  Container(
//                               height: 150,
//                               width: 150,
//                               child: const Image(image: AssetImage('assets/image/no-pictures.png'),
//                               ),
//                             );
//                           },
//                           placeholder:  (context , value ){
//                             return Container(
//                               height: 150,
//                               width: 150,
//                               child: const Image(image: AssetImage('assets/image/86075-loading-upload-image.gif'),
//                               ),
//                             );
//                           },
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(item.Title,
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black,
//                                     shadows: [
//                                       Shadow(
//                                         blurRadius:0.2,
//                                         color: Colors.black,
//                                         offset: Offset.fromDirection(100),
//                                       ),
//                                     ],
//                                   ),),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Expanded(
//                                   child: Text(item.Overview,
//                                     maxLines: 4,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w300,
//                                       color: Colors.black,
//                                       shadows: [
//                                         Shadow(
//                                           blurRadius:0.2,
//                                           color: Colors.black,
//                                           offset: Offset.fromDirection(100),
//                                         ),
//                                       ],
//                                     ),),
//                                 ),
//                                 SizedBox(
//                                   height: 4,
//                                 ),
//                                 IconButton(onPressed: (){
//
//                                   movie.removeAt(index);
//                                 },
//                                     icon:Icon(Icons.delete_rounded)
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Row(
//                                         children: List.generate(5, (index) {
//                                           return Icon(Icons.star,size: 20,
//                                             color:item.VoteAverage /2< index?Colors.black45: Colors.amber,
//                                           );
//                                         }),
//                                       ),
//                                     ),
//                                     Text('(${item.VoteAverage.ceil() /2})'),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//             separatorBuilder: (context, index)
//             {
//               return SizedBox(
//                 height: 10,
//               );
//             },
//             itemCount: movie.length,
//           ),
//         ],
//       ),
//     ) ,
//   );
// }




// class BuildWatchListItems extends StatefulWidget {
//   const BuildWatchListItems({Key? key, required this.movie}) : super(key: key);
//   final List<MovieEntities> movie;
//   @override
//   State<BuildWatchListItems> createState() => _BuildWatchListItemsState();
// }
//
// class _BuildWatchListItemsState extends State<BuildWatchListItems> {
//
//  // late final FavoriteRemoteDataSourceImpl favoriteRemoteDataSourceImpl;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child:Padding(
//         padding: const EdgeInsets.only(top:6, left: 6, right: 6,bottom: 6 ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListView.separated(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               physics: BouncingScrollPhysics(),
//               itemBuilder: (context, index){
//                 final item = widget.movie[index];
//                 return GestureDetector(
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(id: item.id,)));
//                   },
//                   child: Card(
//                     color: Colors.white38,
//                     child: Container(
//                       width: double.infinity,
//                       height: 150,
//                       child: Row(
//                         children: [
//                           CachedNetworkImage(
//                             imageUrl: ConstanceApi.imagePath(item.PosterPath),
//                             height: 150,
//                             width: 150,
//                             fit: BoxFit.fill,
//                             errorWidget: (context ,child, error){
//                               return  Container(
//                                 height: 150,
//                                 width: 150,
//                                 child: const Image(image: AssetImage('assets/image/no-pictures.png'),
//                                 ),
//                               );
//                             },
//                             placeholder:  (context , value ){
//                               return Container(
//                                 height: 150,
//                                 width: 150,
//                                 child: const Image(image: AssetImage('assets/image/86075-loading-upload-image.gif'),
//                                 ),
//                               );
//                             },
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.only(top:5, left: 5, right: 5,bottom: 2),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(item.Title,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.black,
//                                       shadows: [
//                                         Shadow(
//                                           blurRadius:0.2,
//                                           color: Colors.black,
//                                           offset: Offset.fromDirection(100),
//                                         ),
//                                       ],
//                                     ),),
//                                   SizedBox(
//                                     height: 7.0,
//                                   ),
//                                   Text(item.Overview,
//                                     maxLines: 4,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w300,
//                                       color: Colors.black,
//                                       shadows: [
//                                         Shadow(
//                                           blurRadius:0.2,
//                                           color: Colors.black,
//                                           offset: Offset.fromDirection(100),
//                                         ),
//                                       ],
//                                     ),),
//                                   SizedBox(
//                                     height: 4,
//                                   ),
//
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: Row(
//                                           children: List.generate(5, (index) {
//                                             return Icon(Icons.star,size: 20,
//                                               color:item.VoteAverage /2< index?Colors.black45: Colors.amber,
//                                             );
//                                           }),
//                                         ),
//                                       ),
//                                       Text('(${item.VoteAverage.ceil() /2})'),
//                                     ],
//                                   ),
//
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Expanded(
//                                     child: Align(
//                                       alignment: Alignment.bottomRight,
//                                       child: ElevatedButton(
//                                         style : ButtonStyle(
//                                           backgroundColor: MaterialStateProperty.all(Colors.black),
//                                         ),
//                                         onPressed: ()
//                                         {
//                                           BlocProvider.of<WatchlistBloc>(context)
//                                             ..add(RemoveWatchListItemEvent(
//                                               media: MovieEntities(
//                                                   BackdropPath: item.BackdropPath,
//                                                   PosterPath: item.PosterPath,
//                                                   id: item.id,
//                                                   originalTitle: item.originalTitle,
//                                                   Overview: item.Overview,
//                                                   Popularity: item.Popularity,
//                                                   ReleaseDate: item.ReleaseDate,
//                                                   Title: item.Title,
//                                                   Video: item.Video,
//                                                   VoteAverage: item.VoteAverage,
//                                                   VoteCount: item.VoteCount, TrailerId: '',isFav: true
//                                               ),
//                                             ));
//                                           setState(() {
//                                             widget.movie.removeAt(
//                                                 index
//                                             );
//                                           });
//
//                                         },
//                                         child: Text('Remove', style: TextStyle(
//                                             color: Colors.white
//                                         ),),
//                                       ),
//
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index)
//               {
//                 return SizedBox(
//                   height: 10,
//                 );
//               },
//               itemCount: widget.movie.length,
//             ),
//           ],
//         ),
//       ) ,
//     );
//   }
// }
//
