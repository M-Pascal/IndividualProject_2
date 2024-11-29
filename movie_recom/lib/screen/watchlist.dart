import 'package:flutter/material.dart';

class WatchList extends StatelessWidget {
  final List<Map<String, String>> watchList;

  const WatchList({super.key, required this.watchList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'Watch List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: watchList.isEmpty
          ? const Center(
              child: Text(
                'Your Watch List is Empty',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: watchList.length,
              itemBuilder: (context, index) {
                final movie = watchList[index];
                return ListTile(
                  leading: Image.network(
                    movie['poster_path']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, size: 50, color: Colors.red),
                  ),
                  title: Text(
                    movie['title']!,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
    );
  }
}
