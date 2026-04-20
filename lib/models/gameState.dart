// gameState.dart
import 'dart:ui';

class GameState {
  static final GameState _instance = GameState._internal();
  factory GameState() => _instance;
  GameState._internal();

  bool isModern = false;
  bool hasWeapon = false;

  // moderne stats
  int energy = 0;
  int fat = 0;
  int stress = 0;

  Color get themeColor => isModern
      ? const Color(0xFF693014)
      : const Color(0xFF99783C);

  void reset() {
    hasWeapon = false;
    isModern = false;
    energy = 0;
    fat = 0;
    stress = 0;
  }
}