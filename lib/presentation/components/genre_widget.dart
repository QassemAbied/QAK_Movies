import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/api.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_bloc.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_event.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_state.dart';
import 'package:flutter/material.dart';

import '../../core/di.dart';
import '../../domain/entities/genre_entities.dart';
import 'list_view_viertical.dart';
import 'list_view_widget.dart';

class GenreWidget extends StatefulWidget {
  const GenreWidget({Key? key , this.SelectItem=28 ,required this.genrelist}) : super(key: key);
 final int SelectItem ;
 final List<GenreEntities> genrelist;
  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  late  int SelectItem;
  @override
  void initState() {
    super.initState();
    SelectItem = widget.SelectItem;
  }


  @override
  Widget build(BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 5 , right: 5),
            child: BlocBuilder<MovieBloc , MovieState>(
              builder: (context , state){
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Categores',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius:0.2,
                          color: Colors.blueGrey.shade400,
                          offset: Offset.fromDirection(100),
                        ),
                      ],
                    ),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context , index){
                          final item = widget.genrelist[index];
                          return GestureDetector(
                            onTap: (){
                              SelectItem = item.id;
                              context.read<MovieBloc>()..add(MovieByGenreEvent(SelectItem, ''));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: SelectItem==item.id? Colors.black : Colors.white,
                                  border: Border.all(color: Colors.black , width: 2.0),
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(
                                child: Text(item.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color:SelectItem==item.id? Colors.white : Colors.black,
                                  ),),
                              ),
                            ),
                          );
                        },
                        itemCount: widget.genrelist.length ,
                        separatorBuilder: (context , index){
                          return const SizedBox(
                            width: 30.0,
                          );
                        },
                      ),
                    ),


                  ],
                );
              },

            ),
          );


  }
}


