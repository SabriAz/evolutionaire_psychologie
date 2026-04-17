import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String asset;
  final double height;

  const CharacterImage({
    super.key,
    required this.asset,
    this.height = 260,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(asset, height: height);
  }
}