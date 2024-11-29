class Movie {
  final String title;
  final String backdrop_path;
  final String original_title;
  final String overview;
  final String poster_path;
  final String release_date;
  final double vote_average;

  Movie({
    required this.title,
    required this.backdrop_path,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"] ?? "No Title",
      backdrop_path: json["backdrop_path"] ?? "",
      original_title: json["original_title"] ?? "No Original Title",
      overview: json["overview"] ?? "No Overview",
      poster_path: json["poster_path"] ?? "",
      release_date: json["release_date"] ?? "No Release Date",
      vote_average: (json["vote_average"] ?? 0).toDouble(),
    );
  }
}
