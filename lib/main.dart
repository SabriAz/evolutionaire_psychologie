import 'package:firebase_demo_test/screens/mainMenuScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UXADE Evolutionaire Psychologie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JejuHallasan',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Container(
        color: Colors.black,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 926,
              maxHeight: 428,
            ),
            child: OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.portrait) {
                  return Scaffold(
                    backgroundColor: Colors.black,
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.screen_rotation, color: Colors.white, size: 64),
                          SizedBox(height: 20),
                          Text(
                            "Draai je scherm\nom te spelen",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const MainMenuScreen();
              },
            ),
          ),
        ),
      ),
    );
  }
}