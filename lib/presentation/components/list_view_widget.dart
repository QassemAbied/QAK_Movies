import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import 'package:untitled3/presentation/views/details_screen.dart';

import '../../core/api.dart';
import '../../domain/entities/genre_entities.dart';

class BuildListView extends StatelessWidget {
  const BuildListView({Key? key, required this.movielist}) : super(key: key);
  final List<MovieEntities> movielist;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 250,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          final item = movielist[index];
          final selectStar= item.VoteAverage /2;
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(id: item.id)));
            },
            child: Container(
              height: 230,
              width: 150,
              child: Stack(

                children: [
                  Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: ConstanceApi.imagePath(item.BackdropPath),
                        fit: BoxFit.fill,
                        height: 200,
                        imageBuilder: (context , imageProvider){
                          return  Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,

                                )
                            ),
                          );
                        },
                        placeholder:  (context , value ){
                          return Container(
                            height: 200,
                            width: 150,
                            child: const Image(image: AssetImage('assets/image/86075-loading-upload-image.gif'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,size: 20,
                                  color:selectStar< index?Colors.black45: Colors.amber,
                                );
                              }),
                            ),
                          ),
                          Text('(${item.VoteAverage.ceil() /2})'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );

        },
        itemCount: movielist.length ,
        separatorBuilder: (context , index){
          return const SizedBox(
            width: 20.0,
          );
        },
      ),
    );
  }
}
