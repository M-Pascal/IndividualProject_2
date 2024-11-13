import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.indigo.shade900,
        titleSpacing: 20,
        title: Text(
          'SEARCHING...',
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

      // Main body of the search page
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for a song...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade800,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            // Search results for later..
            
          ],
        ),
      ),
    );
  }
}