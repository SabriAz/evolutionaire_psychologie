// gameState.dart
import 'dart:ui';

class GameState {
  static final GameState _instance = GameState._internal();
  factory GameState() => _instance;
  GameState._internal();

  bool hasWeapon = false;
  Color themeColor = const Color(0xFF99783C);

  // moderne stats
  int energy = 0;
  int fat = 0;
  int stress = 0;

  void reset() {
    hasWeapon = false;
    energy = 0;
    fat = 0;
    stress = 0;
  }
}