import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/presentation/state_management/search_bloc/search_bloc.dart';
import 'package:untitled3/presentation/state_management/search_bloc/search_event.dart';
import 'package:untitled3/presentation/state_management/search_bloc/search_state.dart';

import '../../core/di.dart';
import '../components/build_search_items.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, this.query = ''}) : super(key: key);
  final String query;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController = TextEditingController();

  late String query;
  @override
  void initState() {
    super.initState();
    query = widget.query;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          Sl<SearchMovieBloc>()..add(SearchEvent(query)),
      child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          'Search Movie',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                blurRadius: 0.2,
                                color: Colors.black,
                                offset: Offset.fromDirection(100),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            controller: SearchController,
                            onChanged: (value) {
                              query = value;
                              BlocProvider.of<SearchMovieBloc>(context)
                                ..add(SearchEvent(value));
                            },
                            decoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Search From Movie',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  SearchController.text = '';
                                },
                                icon: const Icon(Icons.clear),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  state.searchData.isNotEmpty
                      ? Container(
                          width: double.infinity,
                          height: 490,
                          child: BuildSearchItems(
                            movie: state.searchData,
                          ))
                      : Container(
                          child: Center(
                              child: Image(
                            image: AssetImage(
                                'assets/image/101307-empty-view-image.gif'),
                          )),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
