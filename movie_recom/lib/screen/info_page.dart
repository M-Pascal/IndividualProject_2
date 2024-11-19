import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final dynamic movie;

  const InfoPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final List<dynamic> favoriteMovies = [];
  final List<dynamic> watchListMovies = [];

  void addToFavorites(dynamic movie) {
    if (!favoriteMovies.contains(movie)) {
      setState(() {
        favoriteMovies.add(movie);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${movie['title']} added to Favorites!')),
      );
    }
  }

  void addToWatchlist(dynamic movie) {
    if (!watchListMovies.contains(movie)) {
      setState(() {
        watchListMovies.add(movie);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${movie['title']} added to Watchlist!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.indigo.shade900,
        titleSpacing: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.movie, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Text(
              'DETAILS...',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie['image'], // Use the large image URL
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              movie['title'] ?? 'Unknown Title',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(movie['genre']?.join(', ') ?? ''),
            const SizedBox(height: 10),
            Text(
              movie['description'] ?? 'No description available.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () => addToFavorites(movie),
                  icon: const Icon(Icons.favorite),
                  label: const Text('Like'),
                ),
                ElevatedButton.icon(
                  onPressed: () => addToWatchlist(movie),
                  icon: const Icon(Icons.add),
                  label: const Text('Watchlist'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
