import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_recom/screen/btn_nav.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        toolbarHeight: 70,
        title: const Center(
          child: Text(
            'Movie_Recom',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Welcome\n To the Movie Recommendation Application',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 25, 34, 122)),
                  ),
                ),
              ),
            ),
            Lottie.asset('assets/movie.json', height: 200),
            const SizedBox(height: 10),
            const Text(
              'Get & save your favorite movies to your watch list!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BtnNavigator(initialIndex: 1)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 27, 41, 121),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
