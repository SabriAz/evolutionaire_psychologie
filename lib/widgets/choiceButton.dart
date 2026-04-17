import 'package:flutter/material.dart';
import '../models/situation.dart';

class ChoiceButton extends StatefulWidget {
  final Choice choice;
  final VoidCallback onPressed;
  final bool isSelected;

  const ChoiceButton({
    super.key,
    required this.choice,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isSelected
              ? Colors.white.withValues(alpha: 0.9)
              : Colors.black.withValues(alpha: 0.3),
          foregroundColor: widget.isSelected
              ? Colors.black
              : Colors.white,
          side: BorderSide(
            color: widget.isSelected ? Colors.white : Colors.white,
            width: widget.isSelected ? 2.5 : 1.5,
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(widget.choice.description),
      ),
    );
  }
}