import 'package:firebase_demo_test/models/situation.dart';
import 'package:firebase_demo_test/widgets/choice_button.dart';
import 'package:firebase_demo_test/widgets/timer.dart';
import 'package:flutter/material.dart';
import '../models/gameState.dart';
import 'explanationScreen.dart';
import 'endScreen.dart';
import 'mainMenuScreen.dart';

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

  // Situaties waar het wapen wordt opgepakt zodra je ze verlaat
  static const _weaponPickupIds = {13, 98};

  // Situaties waar isAttack=true naar game-over zonder wapen leidt
  static const _bearSituationId = 26;
  static const _wolfSituationId = 27;

  void _navigateNext(Choice choice) {
    // Wapen oppakken: als je deze situatie verlaat, heeft de speler een wapen
    if (_weaponPickupIds.contains(widget.situation.id)) {
      GameState().hasWeapon = true;
    }

    // Bepaal de werkelijke outcome
    int outcome = _resolveOutcome(choice);

    if (outcome == 100 || outcome == 101) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => EndScreen(
            isWin: outcome == 100,
          ),
        ),
      );
      return;
    }

    if (widget.situation.explanationNeeded) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => ExplanationScreen(
            outcome: outcome, // 👈 direct meegeven
            situation: widget.situation,
            situations: widget.situations,
          ),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => SituationScreen(
            situation: widget.situations.firstWhere((s) => s.id == outcome),
            situations: widget.situations,
          ),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    }
  }

  /// Pas de outcome aan op basis van wapenstatus bij aanvalskeuzes
  int _resolveOutcome(Choice choice) {
    if (!choice.isAttack) return choice.outcome;
    if (GameState().hasWeapon) return choice.outcome;

    // Aanvallen zonder wapen → vaste game-over per tegenstander
    if (widget.situation.id == _bearSituationId) return 1001;
    if (widget.situation.id == _wolfSituationId) return 1004;

    // Andere situaties met isAttack (stam): outcome blijft zoals gedefinieerd
    return choice.outcome;
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
            top: 30,
            right: 16,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              icon: const Icon(Icons.home, color: Colors.white, size: 32),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Terug naar hoofdscherm"),
                    content: const Text("Weet je zeker dat je terug wil naar het hoofdscherm"),
                    actions: [
                      TextButton(
                        child: const Text("Annuleren"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text("Ja"),
                        onPressed: () {
                          GameState().reset(); // reset wapen bij thuisgaan
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => MainMenuScreen()),
                                (route) => false,
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
              timer: 12,
              stopped: _choiceMade,
              onFinished: () {
                if (!_choiceMade) {
                  _navigateNext(widget.situation.choices[0]);
                }
              },
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 100, right: 90),
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
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
                          Future.delayed(const Duration(milliseconds: 600), () {
                            _navigateNext(choice);
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