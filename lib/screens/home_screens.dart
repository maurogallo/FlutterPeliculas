import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined, size: 30,),
            color: Colors.white,
            onPressed: ()=> showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
      ),
     body: SingleChildScrollView(
      child: Column(
        children: [
           // Tarjetas principales
          CardSwiper( movies:  moviesProvider.onDisplayMovies ),
          // Slider de películas
          MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Populares',
            onNextPage: () => moviesProvider.getPopularMovies(),
          ),
      
          // Listado horizontal de películas
        ],
      )      
     )
    );    
  }
}