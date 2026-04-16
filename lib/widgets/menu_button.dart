import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const MenuButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Colors.white.withValues(alpha: 0.9)
              : Colors.black.withValues(alpha: 0.3),
          foregroundColor: isSelected
              ? Colors.black
              : Colors.white,
          side: BorderSide(
            color: Colors.white,
            width: isSelected ? 2.5 : 1.5,
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}