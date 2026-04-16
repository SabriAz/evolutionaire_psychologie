import 'package:firebase_demo_test/models/situations.dart';
import 'package:flutter/material.dart';
import 'situationScreen.dart';
import 'IntroVideoScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreenBody();
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

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

            Align(
              alignment: Alignment.bottomCenter,

              child: Padding(
                padding: EdgeInsets.all(20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.3),
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1.5),
                    ),

                    child: Text("Prehistorische tijd"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => IntroVideoScreen(
                            situations: prehistoric_situations,
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(width: 8,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.3),
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1.5),
                    ),

                      child: Text("Moderne tijd"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SituationScreen(situation: modern_situations[0], situations: modern_situations,),
                            )
                        );
                      },
                  )
                ],
              )
              )
            ),
          ],
        ),
    );
  }
}
