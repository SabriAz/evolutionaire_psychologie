import 'package:flutter/material.dart';
import 'situationScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreenBody()
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

      body: Align(
        alignment: Alignment.bottomRight,
          child: ElevatedButton(
            child: Text("Start adventure"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SituationScreen()
                  )
              );
            }
        )
      ),
    );
  }
}


