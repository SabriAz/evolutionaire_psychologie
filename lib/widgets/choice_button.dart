import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/situation.dart';

class ChoiceButton extends StatelessWidget{
  final Choice choice;
  final VoidCallback onPressed;
  const ChoiceButton ({super.key, required this.choice, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black.withValues(alpha: 0.3),
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white, width: 1.5),
        ),
        onPressed: onPressed,
        child: Text(choice.description));
  }

}