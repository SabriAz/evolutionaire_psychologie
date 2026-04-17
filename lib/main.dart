import 'package:firebase_demo_test/screens/mainMenuScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UXADE Evolutionaire Psychologie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JejuHallasan',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainMenuScreen(),
    );
  }
}