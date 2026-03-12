
class Movie {
  String title;
  int year;
  String posterUrl;

  Movie ({required this.title, required this.year, required this.posterUrl});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'year': year,
      'posterUrl': posterUrl
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      year: map['year'],
      posterUrl: map ['posterUrl']
    );
  }
}