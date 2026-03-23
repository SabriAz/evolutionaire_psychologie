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
            outcome: 2)


  ])
];