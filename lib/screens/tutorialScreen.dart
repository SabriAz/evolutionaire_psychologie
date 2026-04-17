import 'package:firebase_demo_test/screens/situationScreen.dart';
import 'package:flutter/material.dart';
import 'introVideoScreen.dart';
import '../models/situation.dart';

class TutorialScreen extends StatelessWidget {
  final List<Situation> situations;

  const TutorialScreen({super.key, required this.situations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // achtergrond
          Image.asset(
            "assets/images/storyImages/01.wakker_worden.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // donkere overlay voor leesbaarheid
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 60),

              // tekst + character
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // character
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/tutorial_character.png",
                        height: 260,
                      ),
                    ),

                    // speech bubble
                    Positioned(
                      top: 40,
                      left: 30,
                      right: 30,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          "Oh nee! Je bent wakker geworden\n"
                              "300.000 jaar geleden...\n\n"
                              "Je bevindt je in een kamp.\n\n"
                              "Maak snel keuzes op basis van de situatie.\n\n"
                              "Let op: jouw keuzes bepalen\n"
                              "of je overleeft.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // knop
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 600),
                        pageBuilder: (_, __, ___) => SituationScreen(
                          situation: situations[0],
                          situations: situations,
                        ),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  },
                  child: const Text("Start"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}