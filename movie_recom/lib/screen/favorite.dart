import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<dynamic> favoriteMovies;

  const FavoritePage({Key? key, required this.favoriteMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'MY_FAVORITES',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      body: favoriteMovies.isEmpty
          ? const Center(child: Text('No favorites yet!'))
          : ListView.builder(
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                final movie = favoriteMovies[index];
                return ListTile(
                  leading: Image.network(movie['thumbnail']),
                  title: Text(movie['title']),
                );
              },
            ),
    );
  }
}
