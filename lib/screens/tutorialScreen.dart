import 'package:flutter/material.dart';
import '../models/situations.dart';
import '../widgets/menuButton.dart';
import '../widgets/speechBubble.dart';
import 'situationScreen.dart';
import '../models/situation.dart';

class TutorialScreen extends StatelessWidget {
  final List<Situation> situations;

  const TutorialScreen({super.key, required this.situations});

  bool get _isModern => situations == modern_situations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            _isModern
                ? "assets/images/storyImages_modern/1m_wakker_worden.png"
                : "assets/images/storyImages_prehistoric/01.wakker_worden.png",
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: SpeechBubble(
                            text: _isModern
                                ? "Het is 2026 en je smartphone bepaalt je dag...\n\n"
                                "Maak keuzes op basis van de situatie "
                                "maar let op: jouw keuzes bepalen hoe jouw leven eruitziet."
                                : "Oh nee! Je bent wakker geworden 300.000 jaar geleden... "
                                "Je bevindt je in een kamp.\n\n"
                                "Maak keuzes op basis van de situatie "
                                "maar let op: jouw keuzes bepalen je overleving.",
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Transform.translate(
                        offset: const Offset(0, 60),
                        child: Image.asset(
                          _isModern
                              ? "assets/images/modern_guide.png"
                              : "assets/images/prehistoric_guide.png",
                          height: 260,
                        ),
                      ),
                    ),
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
                        transitionsBuilder: (_, animation, __, child) =>
                            FadeTransition(opacity: animation, child: child),
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