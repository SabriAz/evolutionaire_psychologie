class Situation {
  final int id;
  final String description;
  final List <Choice> choices;

  const Situation ({required this.id, required this.description, required this.choices});

}

class Choice{
  final int id;
  final String description;
  final int outcome;


  const Choice ({required this.id, required this.description, required this.outcome});

}


