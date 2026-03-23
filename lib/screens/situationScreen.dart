import 'package:firebase_demo_test/models/situation.dart';
import 'package:firebase_demo_test/screens/explanationScreen.dart';
import 'package:flutter/material.dart';

class SituationScreen extends StatefulWidget {
  final Situation situation;

  const SituationScreen({super.key, required this.situation});
  @override
  State<StatefulWidget> createState() => _SituationScreenState();

}

class _SituationScreenState extends State<SituationScreen> {
  int? selectedChoice;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.lightBlue,
      title: Text("You are in the situation screen")
    ),
  body: Column(
    children: [
      Text(widget.situation.description),
      Row (
        children: widget.situation.choices.map((choice) => ElevatedButton(
          onPressed: () {
            setState(() {
              selectedChoice = choice.id;
            });
            Future.delayed(Duration(seconds: 1), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ExplanationScreen(choice: choice,))
              );
            });
          },
          child: Text(choice.description),
      )).toList()
    ),
        if (selectedChoice != null)
        Text("Je heb gekozen voor keuze $selectedChoice")
    ])
    );
  }
}