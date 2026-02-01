import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/features/search_screen.dart';
import 'package:untitled3/features/watch_kist_secreen.dart';
import '../favorites/view/favorite_screen.dart';
import '../home/view/home_screen.dart';
import 'controller/botton_nav_cubit.dart';
import 'controller/botton_nav_state.dart';

class BottonNavScreen extends StatelessWidget {
  BottonNavScreen({Key? key}) : super(key: key);
  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
     const FavoriteScreen(),

    const WatchKistSecreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeBottomCubit, ChangeStates>(
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: true,
            builder: (context) {
              return screens[ChangeBottomCubit.get(context).currentIndex];
            },
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: context.colors.onSurface,
            elevation: 0.0,
            currentIndex: ChangeBottomCubit.get(context).currentIndex,
            onTap: (index) {
              ChangeBottomCubit.get(context).changeBottom(index);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'WatchList',
              ),
            ],
          ),
        );
      },
    );
  }
}
