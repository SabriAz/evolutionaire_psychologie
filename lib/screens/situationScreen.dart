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
  body: Row(
    children:[
      ElevatedButton(onPressed: () {}, child: Text("Keuze 1")),
      ElevatedButton(onPressed: () {}, child: Text("Keuze 2")),
      ElevatedButton(onPressed: () {}, child: Text("Keuze 3"))

    ]
  )
  );
}}