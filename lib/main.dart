import 'package:firebase_demo_test/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService _service = FirestoreService();
  List<Movie> movies = [];

@override
void initState() {
  super.initState();
  _service.addMovie(Movie(
    title: 'Inception',
    year: 2010,
    posterUrl: 'voorbeeld/url/inception.jpg',
  ));
  loadMovies();
}

void loadMovies() async {
  List<Movie> loaded = await _service.getMovies();
  setState(() {
    movies = loaded;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Test')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movies[index].title),
            subtitle: Text(movies[index].year.toString()),
          );
        },
      ),
    );
  }
}