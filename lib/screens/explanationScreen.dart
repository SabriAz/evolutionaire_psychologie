import 'package:firebase_demo_test/screens/situationScreen.dart';
import 'package:flutter/material.dart';

class ExplanationScreen extends StatelessWidget {
  const ExplanationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text("Super goede uitleg..."),
          ElevatedButton(
            child: Text("Volgende"),
            onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => SituationScreen()));
          },)
        ]
      )
    );
  }
    
}