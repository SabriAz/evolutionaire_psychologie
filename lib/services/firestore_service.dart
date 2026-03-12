import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo_test/models/movie.dart';

class FirestoreService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Future <void> addMovie (Movie movie) async {
    await _database.collection('movies').add(movie.toMap());
  }

  Future <List<Movie>> getMovies() async {
    final snapshot = await _database.collection('movies').get();

    List<Movie> movies = [];

    for (var doc in snapshot.docs) {
      Movie movie = Movie.fromMap(doc.data());
      movies.add(movie);
    }
    return movies;
  }
}