import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget{
  final int timer;

  const CountdownTimer({required this.timer});

  @override
  State<StatefulWidget> createState() => _TimerState();
}

class _TimerState extends State<CountdownTimer> {
  late int currentSeconds;
  @override
  void initState() {
    super.initState();
    currentSeconds = widget.timer;
    Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        currentSeconds--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
        child: CircularProgressIndicator()
        ),
        Center(
            child: Text("$currentSeconds")
        )
      ],
    );
  }
}