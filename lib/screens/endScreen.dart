import 'package:firebase_demo_test/models/gameState.dart';
import 'package:firebase_demo_test/screens/mainMenuScreen.dart';
import 'package:flutter/material.dart';
import '../models/situation.dart';
import '../widgets/menuButton.dart';
import 'modeSelectScreen.dart';
import 'resultScreen.dart';
import 'IntroVideoScreen.dart';
import '../models/situations.dart';

class EndScreen extends StatelessWidget {
  final bool isWin;
  final List<Situation> situations;

  const EndScreen({super.key, required this.isWin, required this.situations});

  bool get _isModern => situations == modern_situations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            isWin
                ? (_isModern
                ? "assets/images/storyImages_modern/100m_goed_einde.png"
                : "assets/images/storyImages_prehistoric/100_succes_1.png")
                : (_isModern
                ? "assets/images/storyImages_modern/102_slecht_einde.png"
                : "assets/images/storyImages_prehistoric/99_gameOver_1.png"),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Container(color: Colors.black.withValues(alpha: 0.4)),


          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isWin
                      ? (_isModern ? "Je hebt een succesvol leven opgebouwd!" : "Je hebt het overleefd!")
                      : "Game Over",
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                ),


                MenuButton(
                  text: "Home",
                  onPressed: () {
                    GameState().reset();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => MainMenuScreen()),
                          (route) => false,
                    );
                  },
                ),

                const SizedBox(height: 12),

                MenuButton(
                  text: "Opnieuw spelen",
                  onPressed: () {
                    GameState().reset();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => IntroVideoScreen(
                          situations: situations,
                        ),
                      ),
                          (route) => false,
                    );
                  },
                ),

                const SizedBox(height: 12),

                MenuButton(
                  text: "Kies speelmodus",
                  onPressed: () {
                    GameState().reset();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const ModeSelectScreen()),
                          (route) => false,
                    );
                  },
                ),

                const SizedBox(height: 12),

                MenuButton(
                  text: "Resultaten",
                  onPressed: () {
                    GameState().reset();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}