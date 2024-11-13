import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.indigo.shade900,
        titleSpacing: 20,
        title: Text(
          'FAVORITE_Song',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 24,
            fontStyle: FontStyle.italic
            ),
          ),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
