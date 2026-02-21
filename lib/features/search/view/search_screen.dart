import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/common_widgets/list_view/all_movies_list_view.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/features/providers.dart';
import 'package:untitled3/generated/l10n.dart';
import '../../../core/common_widgets/list_view/all_movies_shimmer.dart';
import '../../../core/theming/settings_controller/settings_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;

  String query = '';
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;

    final threshold = max - 300;

    if (current >= threshold) {
      final lang = ref.watch(appSettingsProvider).locale;
      ref.read(searchProvider(lang.code).notifier).loadMoreSearch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(appSettingsProvider).locale;
    final searchState = ref.watch(searchProvider(lang.code));

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).Search)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: Column(
          children: [
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: _searchController,
              builder: (context, value, child) {
                return TextField(
                  controller: _searchController,
                  onChanged: (text) {
                    ref.read(searchProvider(lang.code).notifier).updateQuery(text);
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
                              ref
                                  .read(searchProvider('en').notifier)
                                  .updateQuery('');
                            },
                          )
                        : null,
                  ),
                );
              },
            ),
            verticalSpace(20),

            Expanded(
              child: searchState.when(
                data: (searchData) {
                  final movies = searchData.results ?? [];
                  return movies.isNotEmpty
                      ? AllMoviesWidget(
                          scrollController: _scrollController,
                          movieModel: movies,
                          hasMore: searchData.hasMore,
                        )
                      : Image.asset('assets/image/search_images.png');
                },
                error: (error, _) {
                  return Center(child: Text(error.toString() ?? ''));
                },
                loading: () {
                  return const AllMoviesShimmerList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
