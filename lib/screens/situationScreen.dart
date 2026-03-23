import 'package:flutter/material.dart';

class SituationScreen extends StatelessWidget {
  const SituationScreen({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("You are in the situation screen")
      ),
      body: Center(
        child: Text("This is the adventure"),
      )
    );
  }
}