import 'package:flutter/material.dart';
import 'package:playlist_app/screen/homepage.dart';
import 'package:playlist_app/screen/favorite.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class btnNavigator extends StatefulWidget {
  const btnNavigator({super.key});

  @override
  State<btnNavigator> createState() => _btnNavigatorState();
}

class _btnNavigatorState extends State<btnNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom Navigation bar using GNar widget
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
              tabs: [
                GButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  onPressed: () {},
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
                  },
                  icon: Icons.favorite_border_outlined,
                  text: 'Favorite',
                ),
                GButton(
                  onPressed: () {},
                  icon: Icons.library_music,
                  text: 'Library',
                ),
              ],
            ),
          ),
        ),
    );
  }
}