import 'package:flutter/material.dart';
import 'package:movie_recom/screen/homepage.dart';
import 'package:movie_recom/screen/favorite.dart';
import 'package:movie_recom/screen/search.dart';
import 'package:movie_recom/screen/watchlist.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BtnNavigator extends StatefulWidget {
  const BtnNavigator({super.key});

  @override
  State<BtnNavigator> createState() => _BtnNavigatorState();
}

class _BtnNavigatorState extends State<BtnNavigator> {
  // Tracks the current index of the bottom navigation bar
  int _selectedIndex = 0;

  // List of pages to display for each navigation tab
  final List<Widget> _pages = [
    Homepage(),
    SearchPage(),
    FavoritePage(),
    WatchListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps the state of each page and only shows the selected page
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
            padding: EdgeInsets.all(13),
            // Updates _selectedIndex when a new tab is tapped
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
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

// Placeholder widget for pages not yet implemented
class PlaceholderWidget extends StatelessWidget {
  final String text;

  const PlaceholderWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.grey),
      ),
    );
  }
}
