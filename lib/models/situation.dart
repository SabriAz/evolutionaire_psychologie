class Situation {
  final int id;
  final String description;
  final List <Choice> choices;
  final bool explanationNeeded;
  final String explanation;
  final String situationImagePath;
  final String explanationImagePath;

  const Situation ({required this.id, required this.description, required this.choices, required this.explanationNeeded, required this.explanation, required this.situationImagePath, required this.explanationImagePath});

}

class Choice{
  final int id;
  final String description;
  final int outcome;
  final bool isAttack;



  const Choice ({required this.id, required this.description, required this.outcome, this.isAttack = false,});

}


