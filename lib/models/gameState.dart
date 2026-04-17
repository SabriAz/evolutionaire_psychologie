class GameState {
  static final GameState _instance = GameState._internal();
  factory GameState() => _instance;
  GameState._internal();

  bool hasWeapon = false;

  void reset() {
    hasWeapon = false;
  }
}