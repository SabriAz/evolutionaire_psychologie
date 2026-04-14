import 'package:firebase_demo_test/models/situation.dart';

// ID overzicht:
// 1  = Start: je wordt wakker, maag knort
// 2  = Sta op en verken het kamp
// 3  = Onderweg zie je stam praten (via "sta op en ga uit het kamp")
// 4  = Je ziet je stam praten (via verken kamp)
// 5  = Stamlid spreekt je aan (linkerpad)
// 6  = Stamlid spreekt je aan (rechterpad, via "ga door")
// 7  = Je praat met stamlid, hij vraagt je mee naar de rest van de stam
// 8  = Je neemt deel aan de bespreking en verlaat daarna het kamp
// 9  = Je komt een kruispunt tegen
// 10 = Je komt een verlaten tent tegen (bos)
// 11 = Je komt een grot tegen (bergen)
// 12 = Je komt een persoon tegen, hij negeert je (via tent)
// 13 = In de grot vind je een wapen (Fighting +1)
// 14 = Je maag begint te knorren (loop door grot)
// 15 = De grot eindigt, persoon negeert je
// 16 = Geen voedsel, maar een persoon negeert je
// 17 = Je komt een boom met fruit tegen
// 18 = De persoon blijft je negeren (samengekomen pad)
// 19 = Je verzamelt het eten (Food +1)
// 20 = Het eten blijkt meer te zijn dan verwacht
// 21 = Je komt weer een kruispunt tegen
// 22 = Onderweg kom je een muurtekening tegen (links)
// 23 = Onderweg kom je een muurtekening tegen (rechts)
// 24 = Het gaat over beergevaar
// 25 = Het gaat over wolfgevaar
// 26 = Je komt een enorme beer tegen
// 27 = Je komt een wolf tegen
// 99 = Game over
// 100 = Eindscherm

List<Situation> prehistoric_situations = [

  // ─── START ───
  Situation(
    id: 1,
    description: "Je wordt wakker 300.000 jaar geleden in een kamp. Het ziet er grimmig uit.",
    choices: [
      Choice(id: 1, description: "Verken het kamp", outcome: 2),
      Choice(id: 2, description: "Verlaat het kamp", outcome: 3),
    ],
    explanationNeeded: true,
    explanation: "Energie besparen",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── VERKEN KAMP ───
  Situation(
    id: 2,
    description: "Je ziet de stam praten. De sfeer is gespannen.",
    choices: [
      Choice(id: 1, description: "Verken verder", outcome: 4),
      Choice(id: 2, description: "Ga naar de stam", outcome: 5),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GA UIT KAMP ───
  Situation(
    id: 3,
    description: "Je loopt weg, maar ziet de stam overleggen.",
    choices: [
      Choice(id: 1, description: "Loop naar de stam toe", outcome: 5),
      Choice(id: 2, description: "Ga door", outcome: 5),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── VERKEN KAMP VERDER → STAMLID ───
  Situation(
    id: 4,
    description: "Terwijl je het kamp verkent spreekt een stamlid je aan.",
    choices: [
      Choice(id: 1, description: "Val aan", outcome: 99),
      Choice(id: 2, description: "Negeer hem", outcome: 98),
      Choice(id: 3, description: "Praat met hem", outcome: 7),
    ],
    explanationNeeded: true,
    explanation: "Hiërarchie binnen de groep",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── GESPREK KAMP (links) → STAMLID ───
  Situation(
    id: 98,
    description: "Je vindt een speer. Je voelt je sterker.", //(Fighting +1)
    choices: [
      Choice(id: 1, description: "Ga terug naar de stam", outcome: 8), //(Social +1)
      Choice(id: 2, description: "Verlaat het kamp", outcome: 9),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GESPREK KAMP (links) → STAMLID ───
  Situation(
    id: 5,
    description: "Een stamlid spreekt je aan.",
    choices: [
      Choice(id: 1, description: "Val aan", outcome: 99),
      Choice(id: 2, description: "Negeer hem", outcome: 9),
      Choice(id: 3, description: "Praat met hem", outcome: 7),
    ],
    explanationNeeded: true,
    explanation: "Hiërarchie binnen de groep",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── STAMLID VRAAGT JE MEE ───
  Situation(
    id: 7,
    description: "Hij knikt en wenkt je mee naar de groep.",
    choices: [
      Choice(id: 1, description: "Ga mee", outcome: 8), //(Social +1)
      Choice(id: 2, description: "Verlaat het kamp", outcome: 9),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── BESPREKING ───
  Situation(
    id: 8,
    description: "Je neemt deel aan de bespreking en verlaat daarna het kamp.",
    choices: [
      Choice(id: 1, description: "Ga door", outcome: 9),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── KRUISPUNT 1 ───
  Situation(
    id: 9,
    description: "Je komt een kruispunt tegen.",
    choices: [
      Choice(id: 1, description: "Ga het bos in", outcome: 10),
      Choice(id: 2, description: "Ga de bergen in", outcome: 11),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── VERLATEN TENT ───
  Situation(
    id: 10,
    description: "Een verlaten tent. Misschien ligt er iets.",
    choices: [
      Choice(id: 1, description: "Verken de tent", outcome: 12),
      Choice(id: 2, description: "Loop door", outcome: 14),
    ],
    explanationNeeded: true,
    explanation: "Nieuwe kansen ontdekken",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── GROT ───
  Situation(
    id: 11,
    description: "Een donkere grot. Beschutting of gevaar.",
    choices: [
      Choice(id: 1, description: "Verken de grot", outcome: 13),
      Choice(id: 2, description: "Loop door", outcome: 14),
    ],
    explanationNeeded: true,
    explanation: "Nieuwe kansen ontdekken",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── PERSOON NEGEERT JE (via tent) ───
  Situation(
    id: 12,
    description: "Je ziet iemand in de verte. Hij negeert je",
    choices: [
      Choice(id: 1, description: "Ga naar hem toe", outcome: 18),
      Choice(id: 2, description: "Verstop je", outcome: 16),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── WAPEN IN GROT ───
  Situation(
    id: 13,
    description: "Je vindt een wapen.", //(Fighting +1)
    choices: [
      Choice(id: 1, description: "Ga terug", outcome: 14),
      Choice(id: 2, description: "Verken verder", outcome: 15),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── MAAG KNORT (loop door grot) ───
  Situation(
    id: 14,
    description: "Je honger wordt sterker.",
    choices: [
      Choice(id: 1, description: "Ga links", outcome: 16),
      Choice(id: 2, description: "Ga rechts", outcome: 17),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GROT EINDIGT, PERSOON NEGEERT JE ───
  Situation(
    id: 15,
    description: "De grot eindigt en iemand ziet je.. en negeert je",
    choices: [
      Choice(id: 1, description: "Ga naar hem toe", outcome: 18),
      Choice(id: 2, description: "Loop door", outcome: 17),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GEEN VOEDSEL, PERSOON NEGEERT JE ───
  Situation(
    id: 16,
    description: "Geen voedsel, maar iemand ziet je... hij negeert je.",
    choices: [
      Choice(id: 1, description: "Ga naar hem toe", outcome: 18),
      Choice(id: 2, description: "Loop door", outcome: 18),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── BOOM MET FRUIT ───
  Situation(
    id: 17,
    description: "Je komt een boom met fruit tegen.",
    choices: [
      Choice(id: 1, description: "Verzamel het fruit", outcome: 19),
      Choice(id: 2, description: "Ga door", outcome: 94),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── PERSOON BLIJFT JE NEGEREN ───
  Situation(
    id: 18,
    description: "Hij blijft je negeren.",
    choices: [
      Choice(id: 1, description: "Praat, if social 1", outcome: 97),
      Choice(id: 2, description: "Praat, if social is not 1", outcome: 96),
      Choice(id: 3, description: "Val aan, if fighting 1", outcome: 95),
      Choice(id: 4, description: "Val aan, if fighting is not 1", outcome: 96),
    ],
    explanationNeeded: true,
    explanation: "Afhankelijkheid van de groep",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── JE VERZAMELT ETEN ───
  Situation(
    id: 19,
    description: "Je verzamelt het eten (Food +1).",
    choices: [
      Choice(id: 1, description: "Ga door", outcome: 20),
    ],
    explanationNeeded: true,
    explanation: "Voedsel was schaars, dus je moest eten zodra je het vond.Vandaag is eten overal, maar je brein werkt nog hetzelfde, wat leidt tot overeten.",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── MEER ETEN DAN VERWACHT ───
  Situation(
    id: 20,
    description: "Er is meer voedsel dan verwacht.",
    choices: [
      Choice(id: 1, description: "Bewaar (Social +1)", outcome: 21),
      Choice(id: 2, description: "Eet alles (Food +1)", outcome: 21),
    ],
    explanationNeeded: true,
    explanation: "Het brein leerde vooruitdenken om risico’s te vermijden. Vandaag leidt dat tot piekeren over dingen zoals werk of geld.",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── KRUISPUNT 2 ───
  Situation(
    id: 21,
    description: "Je komt weer een kruispunt tegen.",
    choices: [
      Choice(id: 1, description: "Ga links", outcome: 22),
      Choice(id: 2, description: "Ga rechts", outcome: 23),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── MUURTEKENING LINKS ───
  Situation(
    id: 22,
    description: "Onderweg zie je een muurtekening, een waarschuwing?",
    choices: [
      Choice(id: 1, description: "Bekijk", outcome: 24),
      Choice(id: 2, description: "Ga door", outcome: 26),
    ],
    explanationNeeded: true,
    explanation: "Informatie was schaars, dus het brein bleef zoeken naar nieuwe info. Vandaag zorgt dat voor eindeloos scrollen en minder focus. ",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── MUURTEKENING RECHTS ───
  Situation(
    id: 23,
    description: "Onderweg zie je een muurtekening, een waarschuwing?",
    choices: [
      Choice(id: 1, description: "Bekijk", outcome: 25),
      Choice(id: 2, description: "Ga door", outcome: 27),
    ],
    explanationNeeded: true,
    explanation: "Informatie was schaars, dus het brein bleef zoeken naar nieuwe info.Vandaag zorgt dat voor eindeloos scrollen en minder focus. ",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── BEERGEVAAR ───
  Situation(
    id: 24,
    description: "Een muurteking over beren gevaar.",
    choices: [
      Choice(id: 1, description: "Ga de andere kant op", outcome: 27),
      Choice(id: 2, description: "Ga door", outcome: 26),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── WOLFGEVAAR ───
  Situation(
    id: 25,
    description: "Een muurteking over wolven gevaar.",
    choices: [
      Choice(id: 1, description: "Ga de andere kant op", outcome: 26),
      Choice(id: 2, description: "Ga door", outcome: 27),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

//   ─── BEER ───
  Situation(
    id: 26,
    description: "Een enorme beer staat voor je.",
    choices: [
      Choice(id: 1, description: "Val aan, if fighting is 2", outcome: 93),
      Choice(id: 2, description: "Val aan, if social is 2", outcome: 92),
      Choice(id: 3, description: "Val aan, if fighting is not 2 and/ or social is not 2", outcome: 99),
      Choice(id: 4, description: "Ren weg, if food is 1", outcome: 91),
      Choice(id: 5, description: "Ren weg, if food is not 1", outcome: 99),
      Choice(id: 6, description: "Twijfel", outcome: 99),
    ],
    explanationNeeded: true,
    explanation: "Bij gevaar schakelde het lichaam direct over op actie (fight-or-flight). Vandaag gebeurt dat bij stress, wat kan leiden tot langdurige spanning. ",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  // ─── WOLF ───
  Situation(
    id: 27,
    description: "Je komt een wolf tegen.",
    choices: [
      Choice(id: 1, description: "Val aan, if fighting is 1", outcome: 90),
      Choice(id: 2, description: "Val aan, if social is 2", outcome: 89),
      Choice(id: 3, description: "Val aan, if fighting is not 1 and/ or social is not 2", outcome: 99),
      Choice(id: 4, description: "Ren weg, if food is 2", outcome: 88),
      Choice(id: 5, description: "Ren weg, if food is not 2", outcome: 99),
      Choice(id: 6, description: "Twijfel", outcome: 99),
    ],
    explanationNeeded: true,
    explanation: "Bij gevaar schakelde het lichaam direct over op actie (fight-or-flight). Vandaag gebeurt dat bij stress, wat kan leiden tot langdurige spanning. ",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),


  // ─── GAME OVER ───
  Situation(
    id: 88,
    description: "Je bent de wolf te snel af.",
    choices: [
      Choice(id: 1, description: "Ga terug naar kamp.", outcome: 100),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GAME OVER ───
  Situation(
    id: 89,
    description: "Je stam schiet je te hulp en vermoordt de wolf.",
    choices: [
      Choice(id: 1, description: "Ga terug naar kamp", outcome: 100),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GAME OVER ───
  Situation(
    id: 90,
    description: "Je verslaat de wolf met je wapens.",
    choices: [
      Choice(id: 1, description: "Ga terug naar kamp", outcome: 100),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GAME OVER ───
  Situation(
    id: 91,
    description: "Je bent de beer te snel af.",
    choices: [
      Choice(id: 1, description: "Ga terug naar kamp.", outcome: 100),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GAME OVER ───
  Situation(
    id: 92,
    description: "Je stam schiet je te hulp en vermoordt de beer.",
    choices: [
      Choice(id: 1, description: "Ga terug naar kamp", outcome: 100),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GAME OVER ───
  Situation(
    id: 93,
    description: "Je verslaat de beer met je wapens.",
    choices: [
      Choice(id: 1, description: "Ga terug naar kamp", outcome: 100),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── JE VERZAMELT ETEN ───
  Situation(
    id: 94,
    description: "Het tekort aan voeding wordt je teveel..",
    choices: [
      Choice(id: 1, description: "Ga door", outcome: 99),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── JE VERZAMELT ETEN ───
  Situation(
    id: 95,
    description: "Je verslaat hem, hij had eten bij zich.",
    choices: [
      Choice(id: 1, description: "Verzamel het eten", outcome: 19),
      Choice(id: 2, description: "Ga door", outcome: 94),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 96,
    description: "Hij overmeestert je.",
    choices: [
      Choice(id: 1, description: "Ga door", outcome: 99),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── JE VERZAMELT ETEN ───
  Situation(
    id: 97,
    description: "Hij praat terug en geeft je wat eten.",
    choices: [
      Choice(id: 1, description: "Accepteer het eten", outcome: 19),
      Choice(id: 2, description: "Ga door", outcome: 94),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── GAME OVER ───
  Situation(
    id: 99,
    description: "Je overleeft het niet. Game over.",
    choices: [
      Choice(id: 1, description: "Opnieuw proberen", outcome: 1),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─── EINDSCHERM ───
  Situation(
    id: 100,
    description: "Je hebt het overleefd. Goed gedaan.",
    choices: [
      Choice(id: 1, description: "Opnieuw spelen", outcome: 1),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),
];

List<Situation> modern_situations = [
  Situation(
    id: 1,
    description: "Moderne situatie 1",
    choices: [
      Choice(id: 1, description: "Val aan!", outcome: 2),
      Choice(id: 2, description: "Blijf staan", outcome: 2),
      Choice(id: 3, description: "Ren weg!", outcome: 2),
    ],
    explanationNeeded: false,
    explanation: "Zoet voedsel was zeldzaam in de oertijd. Je brein ontwikkelde een sterke voorkeur voor zoet omdat het veel energie bevatte. Daarom is taart of snoep vandaag zo moeilijk te weerstaan — je brein reageert nog steeds alsof suiker zeldzaam is!",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),
  Situation(
    id: 2,
    description: "Moderne situatie 2",
    choices: [
      Choice(id: 5, description: "Ga rusten", outcome: 3),
      Choice(id: 6, description: "Ga op jacht", outcome: 3),
      Choice(id: 7, description: "Doe lichte beweging", outcome: 3),
    ],
    explanationNeeded: false,
    explanation: "In de oertijd was energie sparen levensbelangrijk. Je brein beloont rust omdat beweging vroeger energie kostte die je nodig had voor jagen of vluchten. Daarom voelt de bank zo aantrekkelijk — je oerbrein denkt nog steeds dat je energie moet sparen!",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),
];