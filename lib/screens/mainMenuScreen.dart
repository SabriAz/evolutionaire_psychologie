import 'package:flutter/material.dart';
import 'modeSelectScreen.dart';
import '../widgets/menu_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/intro_screen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Origins',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                  ),
                ),
                const Text(
                  'Een waargebeurd verhaal',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                  ),
                ),

                const SizedBox(height: 60),

                SizedBox(
                  width: 180,
                  height: 45,
                  child: MenuButton(
                    text: "Start spel",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ModeSelectScreen()),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: 180,
                  height: 45,
                  child: MenuButton(
                    text: "Extra's",
                    onPressed: () {
                      print("Extra's geopend");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}