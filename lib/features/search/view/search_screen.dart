import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/common_widgets/list_view/all_movies_list_view.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/features/search/controller/search_cubit.dart';
import 'package:untitled3/features/search/controller/search_state.dart';
import 'package:untitled3/features/search/data/repos/search_repos.dart';
import 'package:untitled3/generated/l10n.dart';
import '../../../core/common_widgets/list_view/all_movies_shimmer.dart';
import '../../../core/di.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/theming/theme_cubit/app_theme_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  late SearchCubit _cubit;
  late final ScrollController _scrollController;
 late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController=TextEditingController();
    _cubit = SearchCubit(
       Sl<SearchRepos>(),

      language: AppThemeCubit.get(context).currentLanguage.code,
    );


    _scrollController = ScrollController()
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;

    final threshold = max - 300;

    if (current >= threshold) {
      _cubit.loadMore();
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),          child: Column(
            children: [

              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _searchController,
                builder: (context, value, child) {
                  return TextField(
                    controller: _searchController,
                    onChanged: (text) {
                      _cubit.updateQuery(text);
                    },
                    decoration: InputDecoration(
                      hintText: S.of(context).searchMovies,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: value.text.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _cubit.updateQuery('');
                        },
                      )
                          : null,
                    ),
                  );
                },
              ),
              verticalSpace(20),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                  return  state.maybeWhen(
                    initial: (){
                      return  Center(child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('assets/image/search_images.png'),
                      ));
                    },
                    loading: (){
                      return const AllMoviesShimmerList();

                    },
                      error: (error){
                      return Center(child: Text(error??''));
                      },
                      success: (searchMovies, hasMore){
                      return searchMovies.isNotEmpty? AllMoviesWidget(
                          scrollController: _scrollController,
                          movieModel: searchMovies,
                          hasMore: hasMore
                      ):Image.asset('assets/image/search_images.png');
                      },
                      orElse: (){
                        return const SizedBox.shrink();
                      });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
