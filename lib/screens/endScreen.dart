import 'package:firebase_demo_test/screens/mainMenuScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/menu_button.dart';
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
            "assets/images/homescreen_background.png",
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