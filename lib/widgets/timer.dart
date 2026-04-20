import 'package:flutter/material.dart';
import 'dart:async';
import '../models/gameState.dart';

class CountdownTimer extends StatefulWidget {
  final int timer;
  final VoidCallback onFinished;
  final bool stopped;
  final ValueChanged<double>? onTick;

  const CountdownTimer({
    required this.timer,
    required this.onFinished,
    this.stopped = false,
    this.onTick,
  });

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
      if (!mounted || widget.stopped) {
        t.cancel();
        return;
      }
      setState(() {
        currentSeconds--;
      });
      widget.onTick?.call(currentSeconds / widget.timer);
      if (currentSeconds == 0) {
        t.cancel();
        widget.onFinished();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = GameState().themeColor;

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: color, width: 4),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 62,
            height: 62,
            child: CircularProgressIndicator(
              value: currentSeconds / widget.timer,
              strokeWidth: 5,
              backgroundColor: color,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.stopped ? Colors.grey : Colors.white,
              ),
            ),
          ),
          Text(
            "$currentSeconds",
            style: TextStyle(
              fontFamily: 'Alata',
              color: widget.stopped ? Colors.grey : Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(color: Colors.black54, blurRadius: 4, offset: Offset(1, 1))
              ],
            ),
          ),
        ],
      ),
    );
  }
}