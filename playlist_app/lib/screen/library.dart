import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.indigo.shade900,
        titleSpacing: 20,
        title: Text(
          'LIBRARY',
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