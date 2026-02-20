import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/features/all_movies/data/models/all_movies_params.dart';
import 'package:untitled3/core/common_widgets/list_view/all_movies_list_view.dart';
import 'package:untitled3/core/common_widgets/list_view/all_movies_shimmer.dart';
import 'package:untitled3/features/all_movies/view/widgets/app_bar_widget.dart';
import 'package:untitled3/features/home/data/models/movies_category.dart';
import 'package:untitled3/features/providers.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/theming/settings_controller/settings_riverpod.dart';

class AllMoviesScreen extends ConsumerStatefulWidget {
  final MovieCategory category;

  const AllMoviesScreen({super.key, required this.category});

  @override
  ConsumerState<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends ConsumerState<AllMoviesScreen> {
  late final ScrollController _scrollController;

  late final lang = ref.watch(appSettingsProvider).locale;
  late final params = AllMoviesParams(lang.code, widget.category);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    final threshold = max - 300;
    if (current >= threshold) {
      ref.read(allMoviesProvider(params).notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allMovieState = ref.watch(allMoviesProvider(params));
    return Scaffold(
      appBar: AppBar(title: AppBarWidget(category: widget.category)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: allMovieState.when(
          data: (movieModel) {
            return AllMoviesWidget(
              scrollController: _scrollController,
              movieModel: movieModel.movies,
              hasMore: movieModel.hasMore,
            );
          },
          error: (error, _) {
            return Center(child: Text(error.toString() ?? ''));
            if (kDebugMode) {
              print(error.toString());
            }
          },
          loading: () {
            return const AllMoviesShimmerList();
          },
        ),
      ),
    );
  }
}
