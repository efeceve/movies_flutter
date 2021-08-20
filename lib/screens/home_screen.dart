import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProviders = Provider.of<MoviesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies at display'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Main cards
              CardSwiper(
                movies: moviesProviders.onDisplayMovies,
              ),
              //Movies slider
              MovieSlider(
                movies: moviesProviders.popularMovies,
                title: 'Populars',
                onNextPage: () => moviesProviders.getPopularMovies(),
              )
            ],
          ),
        ));
  }
}
