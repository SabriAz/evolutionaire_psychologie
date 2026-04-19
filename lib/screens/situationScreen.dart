import 'package:firebase_demo_test/models/situation.dart';
import 'package:firebase_demo_test/widgets/choiceButton.dart';
import 'package:firebase_demo_test/widgets/timer.dart';
import 'package:flutter/material.dart';
import '../models/gameState.dart';
import '../models/situations.dart';
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

  static const _weaponPickupIds = {13, 98};
  static const _bearSituationId = 26;
  static const _wolfSituationId = 27;

  void _navigateNext(Choice choice) {
    if (_weaponPickupIds.contains(widget.situation.id)) {
      GameState().hasWeapon = true;
    }

    if (choice.statReward != null) {
      switch (choice.statReward) {
        case 'energy':
          GameState().energy++;
          break;
        case 'fat':
          GameState().fat++;
          break;
        case 'stress':
          GameState().stress++;
          break;
      }
    }


    int outcome = _resolveOutcome(choice);

    if (outcome == 100 || outcome == 101) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => EndScreen(
              isWin: outcome == 100,
          situations: widget.situations,),
        ),
      );
      return;
    }

    if (widget.situation.explanationNeeded) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => ExplanationScreen(
            outcome: outcome,
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

  int _resolveOutcome(Choice choice) {

    //moderne checks
    if (choice.isStatCheck) {
      if (widget.situation.id == 23) {
        if (GameState().energy >= 2) return 29;   // promotie
        if (GameState().fat >= 2) return 27;       // uitgeput
        if (GameState().stress >= 3) return 28;    // te veel stress
        return 30;                                  // gewoon oké
      }
      if (widget.situation.id == 24) {
        if (GameState().energy >= 2) return 25;   // top baan
        if (GameState().fat >= 2) return 27;
        if (GameState().stress >= 3) return 28;
        return 26;                                  // matige baan
      }
    }

    //oertijd checks
    if (!choice.isAttack) return choice.outcome;
    if (GameState().hasWeapon) return choice.outcome;
    if (widget.situation.id == _bearSituationId) return 1001;
    if (widget.situation.id == _wolfSituationId) return 1004;


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
                  builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF5C3A1E),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color(0xFF99783C), width: 3),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(4, 4)),
                        ],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Terug naar hoofdmenu?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFE8C97A),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 4, offset: Offset(2, 2)),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          Container(height: 2, color: const Color(0xFF99783C)),

                          const SizedBox(height: 16),

                          Text(
                            "Weet je zeker dat je wil stoppen met overleven?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: const Color(0xFF99783C), width: 2),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "Blijf hier",
                                    style: TextStyle(color: const Color(0xFFE8C97A), fontSize: 15),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF99783C),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 4,
                                  ),
                                  onPressed: () {
                                    GameState().reset();
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (_) => MainMenuScreen()),
                                          (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "Verlaat",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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