import 'package:firebase_demo_test/models/situation.dart';

List <Situation> situations = [
  Situation(
      id: 1,
      description: "Je bent een oermens en je hebt honger. Je ziet in de verte zoet fruit hangen.",
      choices: [
        Choice(
            id: 1,
            description: "Eet fruit op",
            outcome: 2),
        Choice(
            id: 2,
            description: "Sla het over",
            outcome: 2),
        Choice(
            id: 3,
            description: "Bewaar voor later",
            outcome: 2),
        Choice(
            id: 4,
            description: "Ren weg",
            outcome: 2)
      ],
    explanation: "Zoet voedsel was zeldzaam in de oertijd. Je brein ontwikkelde een sterke voorkeur voor zoet omdat het veel energie bevatte. Daarom is taart of snoep vandaag zo moeilijk te weerstaan — je brein reageert nog steeds alsof suiker zeldzaam is!"
  ),
  Situation(
      id: 2,
      description: "Je hebt net gegeten en voelt je zwaar. Rust of bewegen?",
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
      explanation: "In de oertijd was energie sparen levensbelangrijk. Je brein beloont rust omdat beweging vroeger energie kostte die je nodig had voor jagen of vluchten. Daarom voelt de bank zo aantrekkelijk — je oerbrein denkt nog steeds dat je energie moet sparen!"
  )
];