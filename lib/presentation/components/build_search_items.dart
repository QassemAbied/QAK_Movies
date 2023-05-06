import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/api.dart';
import '../../domain/entities/movie_entities.dart';
import '../views/details_screen.dart';

class BuildSearchItems extends StatelessWidget {
  const BuildSearchItems({Key? key ,required this.movie }) : super(key: key);
  final List<MovieEntities> movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:ConditionalBuilder(
        condition:movie .isNotEmpty,
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
                      final item = movie[index];
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
                                    padding: const EdgeInsets.all(8.0),
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
                                          height: 10.0,
                                        ),
                                        Expanded(
                                          child: Text(item.Overview,
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
                                        ),
                                        SizedBox(
                                          height: 4,
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
                    itemCount: movie.length,
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


