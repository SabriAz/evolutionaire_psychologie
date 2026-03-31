import 'package:firebase_demo_test/models/situation.dart';
import 'package:firebase_demo_test/screens/explanationScreen.dart';
import 'package:firebase_demo_test/screens/homeScreen.dart';
import 'package:firebase_demo_test/widgets/choice_button.dart';
import 'package:firebase_demo_test/widgets/timer.dart';
import 'package:flutter/material.dart';

class SituationScreen extends StatefulWidget {
  final Situation situation;
  final List<Situation> situations;

  const SituationScreen({super.key, required this.situation, required this.situations});
  @override
  State<StatefulWidget> createState() => _SituationScreenState();

}

class _SituationScreenState extends State<SituationScreen> {
  int? selectedChoice;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body:Stack(
      children: [
        Image.asset(
          widget.situation.situationImagePath,
          fit: BoxFit.cover,
          width: double.infinity
        ),

        Positioned(
          top: 30,
          right: 16,
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.brown,
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
            ),
            icon: Icon(Icons.home, color: Colors.white, size: 32),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Terug naar hoofdscherm"),
                  content: Text("Weet je zeker dat je terug wil naar het hoofdscherm"),
                  actions: [
                    TextButton(
                      child: Text("Annuleren"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text("Ja"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        Positioned(
          top: 16,
          left: 16,
          child: CountdownTimer(
          timer: 10,
          onFinished: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ExplanationScreen(
                      choice: widget.situation.choices[0],
                      situation: widget.situation,
                      situations: widget.situations
                  )
              )
            )
          ),
        ),
        Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Stack(
              children: [
                Text(
                  widget.situation.description,
                  style: TextStyle(
                    fontSize: 24,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Colors.black,
                  ),
                ),
                Text(
                  widget.situation.description,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ]
            )
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.situation.choices.map((choice) => Padding (
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: ChoiceButton(
                  choice: choice,
                  onPressed: () {
                    setState(() {
                      selectedChoice = choice.id;
                    });
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ExplanationScreen(choice: choice, situation: widget.situation, situations: widget.situations))
                    );
                  });
                },
              ))).toList()
              ),
            )
          )
        ])
      ])
    );
  }
}