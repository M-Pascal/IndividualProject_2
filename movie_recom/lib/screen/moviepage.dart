import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_recom/api/api.dart';
import 'package:movie_recom/models/movie.dart';
import 'package:movie_recom/screen/detail_screen.dart';
import 'package:movie_recom/screen/watchlist.dart';

class MoviePage extends StatefulWidget {

  final Function(Map<String, String>) addToWatchList;


  const MoviePage({super.key, required this.addToWatchList});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  final List<Movie> watchlist = []; // Stores added movies

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  void addToWatchlist(Movie movie) {
    if (!watchlist.contains(movie)) {
      setState(() {
        watchlist.add(movie);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'Movie_Recom',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WatchList(watchList: watchlist.map((movie) => {
                    'title': movie.title,
                    'poster_path': movie.poster_path,
                  }).toList()),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trending Movies',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              FutureBuilder<List<Movie>>(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return TrendingSlider(
                      snapshot: snapshot,
                      onAddToWatchlist: addToWatchlist,
                    );
                  } else {
                    return const Center(child: Text("No data available"));
                  }
                },
              ),
              const SizedBox(height: 25),
              const Text(
                'Top Rated Movies',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              FutureBuilder<List<Movie>>(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return MovieSlider(
                      snapshot: snapshot,
                      onAddToWatchlist: addToWatchlist,
                    );
                  } else {
                    return const Center(child: Text("No data available"));
                  }
                },
              ),
              const SizedBox(height: 25),
              const Text(
                'Upcoming Movies',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              FutureBuilder<List<Movie>>(
                future: upcomingMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return MovieSlider(
                      snapshot: snapshot,
                      onAddToWatchlist: addToWatchlist,
                    );
                  } else {
                    return const Center(child: Text("No data available"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key, required this.snapshot, required this.onAddToWatchlist});

  final AsyncSnapshot<List<Movie>> snapshot;
  final Function(Movie) onAddToWatchlist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final movie = snapshot.data![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(movie: movie, addToWatchList: onAddToWatchlist),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                      height: 200,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.white),
                        onPressed: () => onAddToWatchlist(movie),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key, required this.snapshot, required this.onAddToWatchlist});

  final AsyncSnapshot<List<Movie>> snapshot;
  final Function(Movie) onAddToWatchlist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index, realIndex) {
          final movie = snapshot.data![index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(movie: movie, addToWatchList: onAddToWatchlist),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                    height: 300,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.white),
                      onPressed: () => onAddToWatchlist(movie),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
