import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/features/search/view/search_screen.dart';
import '../../generated/l10n.dart';
import '../favorites/view/favorite_screen.dart';
import '../home/view/home_screen.dart';
import '../profile/view/settings_screen.dart';
import 'controller/botton_nav_cubit.dart';
import 'controller/botton_nav_state.dart';

class BottonNavScreen extends StatelessWidget {
  BottonNavScreen({Key? key}) : super(key: key);
  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
     const FavoriteScreen(),
    const SettingsScreen(),
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
            fixedColor: context.colors.primary,
            elevation: 0.0,
            currentIndex: ChangeBottomCubit.get(context).currentIndex,
            onTap: (index) {
              ChangeBottomCubit.get(context).changeBottom(index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: S.of(context).Home,
              ),
               BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: S.of(context).Search,
              ),
               BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: S.of(context).Favorite,
              ),
               BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label:S.of(context).settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
