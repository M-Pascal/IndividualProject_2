import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_recom/models/movie.dart';

class Api {
  static const _trendingUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=c668ac1846251c054aa8a77e23985c10";

  static const _topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=c668ac1846251c054aa8a77e23985c10";

  static const _upcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=c668ac1846251c054aa8a77e23985c10";

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
}
