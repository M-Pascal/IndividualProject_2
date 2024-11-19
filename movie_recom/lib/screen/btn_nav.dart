import 'package:flutter/material.dart';
import 'package:movie_recom/screen/favorite.dart';
import 'package:movie_recom/screen/homepage.dart';
import 'package:movie_recom/screen/info_page.dart';
import 'package:movie_recom/screen/watchlist.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BtnNavigator extends StatefulWidget {
  const BtnNavigator({super.key});

  @override
  State<BtnNavigator> createState() => _BtnNavigatorState();
}

class _BtnNavigatorState extends State<BtnNavigator> {
  int _selectedIndex = 0;

  // Mock lists for favorite and watchlist movies
  final List<dynamic> _favoriteMovies = [];
  final List<dynamic> _watchListMovies = [];

  // A placeholder movie object to pass to InfoPage (you can replace it with real movie data later)
  final dynamic _placeholderMovie = {
    'title': 'Placeholder Movie',
    'image': 'https://via.placeholder.com/150',
    'description': 'This is a placeholder description.',
    'genre': ['Drama', 'Action']
  };

  @override
  Widget build(BuildContext context) {
    // List of pages with required parameters provided
    final List<Widget> _pages = [
      const Homepage(),
      InfoPage(movie: _placeholderMovie), // Pass a placeholder movie
      FavoritePage(favoriteMovies: _favoriteMovies),
      WatchListPage(watchListMovies: _watchListMovies),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.indigo.shade900,
            activeColor: Colors.white,
            color: Colors.white,
            tabBackgroundColor: Colors.indigo.shade600,
            padding: const EdgeInsets.all(13),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.info_outline,
                text: 'Info',
              ),
              GButton(
                icon: Icons.favorite_border_outlined,
                text: 'Favorite',
              ),
              GButton(
                icon: Icons.movie_creation_rounded,
                text: 'Library',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
