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
  int? selectedChoiceId;
  bool _choiceMade = false;

  void _navigateToExplanation(Choice choice) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => ExplanationScreen(
          choice: choice,
          situation: widget.situation,
          situations: widget.situations,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.situation.situationImagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 16,
            left: 16,
            child: CountdownTimer(
              timer: 10,
              stopped: _choiceMade,
              onFinished: () {
                if (!_choiceMade) {
                  _navigateToExplanation(widget.situation.choices[0]);
                }
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                child: Center(
                  child: Stack(
                    children: [
                      Text(
                        widget.situation.description,
                        textAlign: TextAlign.center,
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
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.situation.choices.map((choice) =>
                      ChoiceButton(
                        choice: choice,
                        isSelected: selectedChoiceId == choice.id,
                        onPressed: () {
                          if (_choiceMade) return;
                          setState(() {
                            selectedChoiceId = choice.id;
                            _choiceMade = true;
                          });
                          Future.delayed(Duration(milliseconds: 600), () {
                            _navigateToExplanation(choice);
                          });
                        },
                      ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}