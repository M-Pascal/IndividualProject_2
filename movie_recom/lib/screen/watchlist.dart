import 'package:flutter/material.dart';

class WatchListPage extends StatelessWidget {
  final List<dynamic> watchListMovies;

  const WatchListPage({Key? key, required this.watchListMovies})
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
              'WATCH_LIST',
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
      body: watchListMovies.isEmpty
          ? const Center(child: Text('No movies in watchlist!'))
          : ListView.builder(
              itemCount: watchListMovies.length,
              itemBuilder: (context, index) {
                final movie = watchListMovies[index];
                return ListTile(
                  leading: Image.network(movie['thumbnail']),
                  title: Text(movie['title']),
                );
              },
            ),
    );
  }
}
