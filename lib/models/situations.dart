import 'package:firebase_demo_test/models/situation.dart';

List <Situation> prehistorische_situations = [
  Situation(
      id: 1,
      description: "Prehistorische situatie 1",
      choices: [
        Choice(
            id: 1,
            description: "Val aan!",
            outcome: 2),
        Choice(
            id: 2,
            description: "Blijf staan",
            outcome: 2),
        Choice(
            id: 3,
            description: "Ren weg!",
            outcome: 2),
        Choice(
            id: 4,
            description: "Ren heel hard weg!!",
            outcome: 2)
      ],
    explanation: "Zoet voedsel was zeldzaam in de oertijd. Je brein ontwikkelde een sterke voorkeur voor zoet omdat het veel energie bevatte. Daarom is taart of snoep vandaag zo moeilijk te weerstaan — je brein reageert nog steeds alsof suiker zeldzaam is!",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_explanation.png"
  ),
  Situation(
      id: 2,
      description: "Prehistorische situatie 2",
      choices: [
        Choice(
            id: 5,
            description: "Ga rusten",
            outcome: 3),
        Choice(
            id: 6,
            description: "Ga op jacht",
            outcome: 3),
        Choice(
            id: 7,
            description: "Doe lichte beweging",
            outcome: 3),
      ],
      explanation: "In de oertijd was energie sparen levensbelangrijk. Je brein beloont rust omdat beweging vroeger energie kostte die je nodig had voor jagen of vluchten. Daarom voelt de bank zo aantrekkelijk — je oerbrein denkt nog steeds dat je energie moet sparen!",
      situationImagePath: "assets/images/bear_situation_2.png",
      explanationImagePath: "assets/images/bear_explanation_2.png"
  )
];

List <Situation> modern_situations = [
  Situation(
      id: 1,
      description: "Moderne situatie 1",
      choices: [
        Choice(
            id: 1,
            description: "Val aan!",
            outcome: 2),
        Choice(
            id: 2,
            description: "Blijf staan",
            outcome: 2),
        Choice(
            id: 3,
            description: "Ren weg!",
            outcome: 2),
        Choice(
            id: 4,
            description: "Ren heel hard weg!!",
            outcome: 2)
      ],
      explanation: "Zoet voedsel was zeldzaam in de oertijd. Je brein ontwikkelde een sterke voorkeur voor zoet omdat het veel energie bevatte. Daarom is taart of snoep vandaag zo moeilijk te weerstaan — je brein reageert nog steeds alsof suiker zeldzaam is!",
      situationImagePath: "assets/images/bear_situation.png",
      explanationImagePath: "assets/images/bear_explanation.png"
  ),
  Situation(
      id: 2,
      description: "Moderne situatie 2",
      choices: [
        Choice(
            id: 5,
            description: "Ga rusten",
            outcome: 3),
        Choice(
            id: 6,
            description: "Ga op jacht",
            outcome: 3),
        Choice(
            id: 7,
            description: "Doe lichte beweging",
            outcome: 3),
      ],
      explanation: "In de oertijd was energie sparen levensbelangrijk. Je brein beloont rust omdat beweging vroeger energie kostte die je nodig had voor jagen of vluchten. Daarom voelt de bank zo aantrekkelijk — je oerbrein denkt nog steeds dat je energie moet sparen!",
      situationImagePath: "assets/images/bear_situation_2.png",
      explanationImagePath: "assets/images/bear_explanation_2.png"
  )
];