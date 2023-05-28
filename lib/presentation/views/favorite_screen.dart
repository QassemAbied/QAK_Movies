import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorit_bloc.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorite_event.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorite_state.dart';
import '../../core/api.dart';
import '../../core/di.dart';
import '../../data/data_sources/favorite_remote_data_source.dart';
import '../../domain/entities/movie_entities.dart';
import 'details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Favorites',
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
              Icons.favorite,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => Sl<FavoritesBloc>()..add(GetFavoritesItemsEvent()),
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            return ConditionalBuilder(
              condition: state.items.isNotEmpty,
              builder: (context) {
                return BuildfavoritesItems(
                  movie: state.items,
                );
              },
              fallback: (context) {
                return Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}

class BuildfavoritesItems extends StatefulWidget {
  const BuildfavoritesItems({Key? key, required this.movie}) : super(key: key);
  final List<MovieEntities> movie;
  @override
  State<BuildfavoritesItems> createState() => _BuildfavoritesItemsState();
}

class _BuildfavoritesItemsState extends State<BuildfavoritesItems> {
  late final FavoriteRemoteDataSourceImpl favoriteRemoteDataSourceImpl;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
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
                                  top: 5, left: 5, right: 5, bottom: 2),
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
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<FavoritesBloc>(
                                              context)
                                            ..add(RemoveFavoritesItemEvent(
                                              media: MovieEntities(
                                                  BackdropPath:
                                                  item.BackdropPath,
                                                  PosterPath: item.PosterPath,
                                                  id: item.id,
                                                  originalTitle:
                                                  item.originalTitle,
                                                  Overview: item.Overview,
                                                  Popularity: item.Popularity,
                                                  ReleaseDate: item.ReleaseDate,
                                                  Title: item.Title,
                                                  Video: item.Video,
                                                  VoteAverage: item.VoteAverage,
                                                  VoteCount: item.VoteCount,
                                                  TrailerId: '',
                                                  isFav: true),
                                            ));
                                          setState(() {
                                            widget.movie.removeAt(index);
                                          });
                                          setState(() {

                                          });
                                        },
                                        child: Text(
                                          'Remove',
                                          style: TextStyle(color: Colors.white),
                                        ),
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
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: widget.movie.length,
            ),
          ],
        ),
      ),
    );
  }
}