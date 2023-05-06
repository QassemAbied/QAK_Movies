import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/presentation/components/my_flutter_app_icons.dart';
import 'package:untitled3/presentation/state_management/cubit/cubit.dart';
import 'package:untitled3/presentation/state_management/cubit/states.dart';
import 'package:untitled3/presentation/views/search_screen.dart';
import '../../core/di.dart';
import '../state_management/favorite_bloc/favorit_bloc.dart';
import '../state_management/movie_bloc/movie_bloc.dart';
import '../state_management/movie_bloc/movie_event.dart';
import '../state_management/watchlist_bloc/watchlist_bloc.dart';
import 'favorite_screen.dart';
import 'watchlist_screen.dart';
import 'home_screen.dart';

class FirstView extends StatelessWidget {
   FirstView({Key? key}) : super(key: key);
  List<Widget> Screens=
  [
    const HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    WatchlistView(),

  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeBottomCubit , ChangeStates>(
      builder: (context , state){
        return Scaffold(
          body: ConditionalBuilder(
            condition:true,
            builder: (context){
              return  Screens[ChangeBottomCubit.get(context).CurrentIndex];
            },
            fallback: (context){
              return Center(child: CircularProgressIndicator());
            },
          ),


          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,

             // selectedItemColor: Colors.black,
              elevation: 0.0,
              currentIndex: ChangeBottomCubit.get(context).CurrentIndex,
              onTap: (index)
              {
                ChangeBottomCubit.get(context).ChangeBottom(index);
              },
              type: BottomNavigationBarType.fixed,

              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search'
                ),

                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark),
                    label: 'WatchList'
                ),
              ]
          ),
        );
      },
    );
  }
}
