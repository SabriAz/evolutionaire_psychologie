import 'package:firebase_demo_test/screens/situationScreen.dart';
import 'package:flutter/material.dart';
import '../models/situation.dart';

class ExplanationScreen extends StatelessWidget {
  final Choice choice;
  final Situation situation;
  final List<Situation> situations;
  const ExplanationScreen({super.key, required this.choice, required this.situation, required this.situations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            situation.explanationImagePath,
              fit: BoxFit.cover,
              width: double.infinity
          ),
          Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Text(
                      situation.explanation,
                      style: TextStyle(
                        fontSize: 24,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      situation.explanation,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                )
              ),
              ElevatedButton(
                child: Text("Volgende"),
                onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SituationScreen(situation: situations.firstWhere((situation) => situation.id == choice.outcome), situations: situations,)));
              },)
            ]
          )
        ]
      )
    );
  }
    
}