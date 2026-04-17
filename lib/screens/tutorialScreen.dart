import 'package:flutter/material.dart';
import '../widgets/menuButton.dart';
import '../widgets/speechBubble.dart';
import 'situationScreen.dart';
import '../models/situation.dart';

class TutorialScreen extends StatelessWidget {
  final List<Situation> situations;

  const TutorialScreen({super.key, required this.situations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/storyImages/01.wakker_worden.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Container(color: Colors.black.withOpacity(0.4)),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 60),

              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 24,
                      right: 24,
                      child: Transform.translate(
                        offset: const Offset(0, -40),
                        child: const SpeechBubble(
                          text: "Oh nee! Je bent wakker geworden 300.000 jaar geleden... "
                              "Je bevindt je in een kamp.\n\n"
                              "Maak keuzes op basis van de situatie "
                              "maar let op: jouw keuzes bepalen je overleving.",
                        ),
                      ),
                    ),

                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Transform.translate(
                          offset: const Offset(0, 60),
                          child: Image.asset(
                          "assets/images/modern_guide.png",
                          height: 260,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: MenuButton(
                  text: "Start",
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => SituationScreen(
                          situation: situations[0],
                          situations: situations,
                        ),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 400),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}