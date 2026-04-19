import 'package:firebase_demo_test/models/gameState.dart';
import 'package:firebase_demo_test/screens/mainMenuScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/menuButton.dart';
import 'resultScreen.dart';
import 'IntroVideoScreen.dart';
import '../models/situations.dart';

class EndScreen extends StatelessWidget {
  final bool isWin;

  const EndScreen({super.key, required this.isWin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            isWin
                ? "assets/images/storyImages_prehistoric/100_succes_1.png"
                : "assets/images/storyImages_prehistoric/99_gameOver_1.png",
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
                  isWin ? "Je hebt het overleefd" : "Game Over",
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                ),

                const SizedBox(height: 30),

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
                          situations: prehistoric_situations,
                        ),
                      ),
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