import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/enum.dart';
import 'package:untitled3/presentation/components/list_view_viertical.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_bloc.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_event.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_state.dart';

import '../../core/di.dart';
import '../components/genre_widget.dart';
import '../components/list_view_widget.dart';
import '../components/popular_widget.dart';
import '../state_management/favorite_bloc/favorit_bloc.dart';
import '../state_management/watchlist_bloc/watchlist_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc , MovieState>(
          builder: (context , state){
           return  Scaffold(

             body: ConditionalBuilder(
               condition: state.popularData.isNotEmpty  && state.movieByGenreData.isNotEmpty &&
                   state.popularData.isNotEmpty &&
               state.upcomingData.isNotEmpty  && state.topratedData.isNotEmpty  &&
                   state.tredData.isNotEmpty ,
               builder: (context){
                 return  SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       PopularWidget(),
                       const SizedBox(
                         height: 10,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5 , right: 5),
                         child: (
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,

                             children: [
                               GenreWidget(genrelist: state.genreData,),
                               const SizedBox(
                                 height: 15,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [

                                   Text('New Release',style: TextStyle(
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
                                   TextButton(
                                     onPressed: (){
                                       Navigator.push(context,
                                         MaterialPageRoute(builder: (context)=>
                                             BuildListViewScreen(
                                               movie: state.movieByGenreData,
                                               appbarText: 'New Release',
                                             ),
                                         ),
                                       );
                                     },
                                     child: Text('See All',style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.grey,
                                       shadows: [
                                         Shadow(
                                           blurRadius:0.2,
                                           color: Colors.black,
                                           offset: Offset.fromDirection(100),
                                         ),
                                       ],
                                     ),),
                                   ),
                                 ],
                               ),
                               const SizedBox(
                                 height: 15,
                               ),
                               BuildListView(movielist: state.movieByGenreData,),
                               const SizedBox(
                                 height: 60,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Top Rated Movie',style: TextStyle(
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
                                   TextButton(
                                     onPressed: (){
                                       Navigator.push(context,
                                         MaterialPageRoute(builder: (context)=>
                                             BuildListViewScreen(movie: state.topratedData,
                                               appbarText: 'Top Rated Movie',
                                             ),
                                         ),
                                       );
                                     },
                                     child: Text('See All',style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.grey,
                                       shadows: [
                                         Shadow(
                                           blurRadius:0.2,
                                           color: Colors.black,
                                           offset: Offset.fromDirection(100),
                                         ),
                                       ],
                                     ),
                                     ),
                                   ),
                                 ],
                               ),
                               const SizedBox(
                                 height: 15,
                               ),
                               BuildListView(movielist: state.topratedData,),
                               const SizedBox(
                                 height: 15,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('UpComing Movie',style: TextStyle(
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
                                   TextButton(
                                     onPressed: (){
                                       Navigator.push(context,
                                         MaterialPageRoute(builder: (context)=>
                                             BuildListViewScreen(
                                                 movie: state.upcomingData,
                                               appbarText: 'UpComing Movie',
                                             ),
                                         ),
                                       );
                                     },
                                     child: Text('See All',style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.grey,
                                       shadows: [
                                         Shadow(
                                           blurRadius:0.2,
                                           color: Colors.black,
                                           offset: Offset.fromDirection(100),
                                         ),
                                       ],
                                     ),),
                                   ),
                                 ],
                               ),
                               const SizedBox(
                                 height: 15,
                               ),
                               BuildListView(movielist: state.upcomingData,),
                               const SizedBox(
                                 height: 15,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Trending Movies',style: TextStyle(
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
                                   TextButton(
                                     onPressed: (){
                                       Navigator.push(context,
                                         MaterialPageRoute(builder: (context)=>
                                             BuildListViewScreen(
                                                 movie: state.tredData,
                                               appbarText: 'Trending Movie',
                                             ),
                                         ),
                                       );
                                     },
                                     child: Text('See All',style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.grey,
                                       shadows: [
                                         Shadow(
                                           blurRadius:0.2,
                                           color: Colors.black,
                                           offset: Offset.fromDirection(100),
                                         ),
                                       ],
                                     ),),
                                   ),
                                 ],
                               ),
                               const SizedBox(
                                 height: 15,
                               ),
                               BuildListView(movielist: state.tredData,),
                             ],
                           )
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
        );

  }
}
