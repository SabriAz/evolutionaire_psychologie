import 'package:flutter/material.dart';
import 'homeScreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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

                _buildMenuButton(
                    context,
                    "Start spel",
                        () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    }
                ),

                const SizedBox(height: 20),

                _buildMenuButton(
                    context,
                    "Extra's",
                        () {
                      print("Extra's geopend");
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String label, VoidCallback onPressed) {
    return SizedBox(
      width: 280,
      height: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5A5A5A),
          foregroundColor: Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.white54, width: 1),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}