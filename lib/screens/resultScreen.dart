import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'homeScreen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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
          Image.asset(
            "assets/images/homescreen_background.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Container(color: Colors.black.withValues(alpha: 0.4)),

          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Lees meer:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF99783C),
                  ),
                ),

                SizedBox(height: 20),

                ...articles.map((article) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: GestureDetector(
                    onTap: () => launchUrl(Uri.parse(article["url"]!)),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        article["title"]!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),

                SizedBox(height: 30),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.3),
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1.5),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                            (route) => false,
                      );
                    },
                    child: Text("Home"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}