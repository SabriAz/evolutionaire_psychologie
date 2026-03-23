import 'package:firebase_demo_test/screens/explanationScreen.dart';
import 'package:flutter/material.dart';

class SituationScreen extends StatefulWidget {
  const SituationScreen({super.key});
  @override
  State<StatefulWidget> createState() => _SituationScreenState();

}

class _SituationScreenState extends State<SituationScreen> {

  int? selectedChoice;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.lightBlue,
      title: Text("You are in the situation screen")
    ),
  body: Column(
    children: [
    Row (
    children:[
      ElevatedButton(onPressed: () {
        setState(() {
          selectedChoice = 1;
        });
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ExplanationScreen()));
          });
      }, child: Text("Keuze 1")),
      ElevatedButton(onPressed: () {
        setState(() {
          selectedChoice = 2;
        });
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ExplanationScreen()));
        });
      }, child: Text("Keuze 2")),
      ElevatedButton(onPressed: () {
        setState(() {
          selectedChoice = 3;
        });
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ExplanationScreen()));
        });
      }, child: Text("Keuze 3")),
    ]
  ),
      if (selectedChoice != null)
      Text("Je heb gekozen voor keuze $selectedChoice")
  ])
  );
}}