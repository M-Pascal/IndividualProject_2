import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'homepage.dart';
import 'moviepage.dart';
import 'watchlist.dart';

class BtnNavigator extends StatefulWidget {
  final int initialIndex; // To handle navigation from the Get Started button
  const BtnNavigator({super.key, this.initialIndex = 0});

  @override
  State<BtnNavigator> createState() => _BtnNavigatorState();
}

class _BtnNavigatorState extends State<BtnNavigator> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const HomePage(),
      const MoviePage(),
      const WatchList(),
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
            horizontal: 20,
            vertical: 14,
          ),
          child: GNav(
            gap: 5,
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
                icon: Icons.movie_filter_sharp,
                text: 'Movies',
              ),
              GButton(
                icon: Icons.movie_edit,
                text: 'Library',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
