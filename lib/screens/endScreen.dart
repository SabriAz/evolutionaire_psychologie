import 'package:firebase_demo_test/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EndScreenBody(),
    );
  }
}

class EndScreenBody extends StatelessWidget {
  const EndScreenBody({super.key});

  final List<Map<String, String>> articles = const [
    {
      "title": "Wat is evolutionaire psychologie?",
      "url": "https://www.psychologytoday.com/us/basics/evolutionary-psychology"
    },
    {
      "title": "Overlevingsinstincten en besluitvorming",
      "url": "https://www.scientificamerican.com/article/evolutionary-psychology"
    },
    {
      "title": "Hoe oermensen samenwerkten",
      "url": "https://www.nationalgeographic.com/science/article/human-evolution"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Image.asset(
            "assets/images/homescreen_background.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Fade background
          Container(
            color: Colors.black.withValues(alpha: 0.4),
          ),

          // Title
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Goed gedaan!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'JejuHallasan',
                    fontSize: 32,
                    color: Color(0xFF99783C),
                    shadows: [
                      Shadow(color: Colors.black, blurRadius: 6)
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Je hebt het avontuur voltooid.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'JejuHallasan',
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black, blurRadius: 4)
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Relevant articles that are based on users favorite scenario's
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lees meer:",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF99783C),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                ...articles.map((article) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: GestureDetector(
                    onTap: () => launchUrl(Uri.parse(article["url"]!)),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        article["title"]!,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),

          // Home button
          Positioned(
            top: 30,
            left: 750,
            right: 0,
            child: Center(
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Color(0xFF99783C),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16),
                ),
                icon: Icon(Icons.home, color: Colors.white, size: 32),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}