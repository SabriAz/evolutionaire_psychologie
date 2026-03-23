import 'package:firebase_demo_test/models/situations.dart';
import 'package:firebase_demo_test/screens/situationScreen.dart';
import 'package:flutter/material.dart';
import '../models/situation.dart';

class ExplanationScreen extends StatelessWidget {
  final Choice choice;
  final Situation situation;
  const ExplanationScreen({super.key, required this.choice, required this.situation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text(situation.explanation),
          ElevatedButton(
            child: Text("Volgende"),
            onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => SituationScreen(situation: situations.firstWhere((situation) => situation.id == choice.outcome))));
          },)
        ]
      )
    );
  }
    
}