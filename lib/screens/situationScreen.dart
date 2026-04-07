import 'package:firebase_demo_test/models/situation.dart';
import 'package:firebase_demo_test/screens/explanationScreen.dart';
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
  bool _choiceMade = false;

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
          top: 16,
          left: 16,
          child: CountdownTimer(
            timer: 10,
            stopped: _choiceMade,
            onFinished: () {
              if (!_choiceMade) { // ← TOEVOEGEN
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExplanationScreen(
                          choice: widget.situation.choices[0],
                          situation: widget.situation,
                          situations: widget.situations,
                    ),
                  ),
                );
              }
            }
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
                      _choiceMade = true;
                    });
                  Future.delayed(Duration(milliseconds: 500), () {
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