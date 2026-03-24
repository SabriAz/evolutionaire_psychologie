import 'package:firebase_demo_test/models/situation.dart';
import 'package:firebase_demo_test/screens/explanationScreen.dart';
import 'package:firebase_demo_test/widgets/choice_button.dart';
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
      body:Stack(
      children: [
        Image.asset(
          widget.situation.situationImagePath,
          fit: BoxFit.cover,
          width: double.infinity
        ),
        Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.situation.description),
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
                          builder: (_) => ExplanationScreen(choice: choice, situation: widget.situation,))
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