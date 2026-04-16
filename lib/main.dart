import 'package:firebase_demo_test/screens/introScreen.dart';
import 'package:flutter/material.dart';
// Zorg dat deze import naar je scherm-bestand wijst
import 'screens/homeScreen.dart';
import 'screens/endScreen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const IntroScreen(),
    );
  }
}