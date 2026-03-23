import 'package:firebase_demo_test/models/situations.dart';
import 'package:flutter/material.dart';
import 'situationScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreenBody()
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

      body: Align(
        alignment: Alignment.bottomRight,
          child: ElevatedButton(
            child: Text("Start adventure"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SituationScreen(situation: situations[0],)
                  )
              );
            }
        )
      ),
    );
  }
}


