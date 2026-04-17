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
    description: "Je wordt wakker 300.000 jaar geleden en je zit midden in de oertijd. In de verte zie je een kamp.",
    choices: [
      Choice(id: 1, description: "Verken het kamp", outcome: 2),
      Choice(id: 2, description: "Verlaat het kamp", outcome: 3),
    ],
    explanationNeeded: true,
    explanation: "In de oertijd moest energie worden gespaard voor jagen of vluchten. Het brein stimuleert daarom rust. Vandaag zorgt dat ervoor dat je sneller kiest voor gemak en dingen uitstelt.",
    situationImagePath: "assets/images/storyImages/01.wakker_worden.png",
    explanationImagePath: "assets/images/explanationImages/1.Energie_besparen_split.png",
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
    situationImagePath: "assets/images/storyImages/02.stam_praten.png",
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
    situationImagePath: "assets/images/storyImages/03.weglopen.png",
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
    explanation: "Je positie in de groep bepaalde je overleving, dus het brein vergelijkt je met anderen. Vandaag gebeurt dat via social media, wat kan zorgen voor onzekerheid en druk.",
    situationImagePath: "assets/images/storyImages/05.stamlid_spreekt.png",
    explanationImagePath: "assets/images/explanationImages/8.sociale_vergelijking_split.png",
  ),

  // ─── GESPREK KAMP (links) → STAMLID ───
  Situation(
    id: 98,
    description: "Je vindt een speer. Je voelt je sterker.",
    choices: [
      Choice(id: 1, description: "Ga terug naar de stam", outcome: 8),
      Choice(id: 2, description: "Verlaat het kamp", outcome: 9),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/98.speer.png",
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
    explanation: "Je positie in de groep bepaalde je overleving, dus het brein vergelijkt je met anderen. Vandaag gebeurt dat via social media, wat kan zorgen voor onzekerheid en druk.",
    situationImagePath: "assets/images/storyImages/05.stamlid_spreekt.png",
    explanationImagePath: "assets/images/explanationImages/8.sociale_vergelijking_split.png",
  ),

  // ─── STAMLID VRAAGT JE MEE ───
  Situation(
    id: 7,
    description: "Hij knikt en wenkt je mee naar de groep.",
    choices: [
      Choice(id: 1, description: "Ga mee", outcome: 8),
      Choice(id: 2, description: "Verlaat het kamp", outcome: 9),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/07.meegevraagd.png",
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
    situationImagePath: "assets/images/storyImages/08.bespreking.png",
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
    situationImagePath: "assets/images/storyImages/09.kruispunt.png",
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
    explanation: "Nieuwsgierigheid hielp om voedsel en veiligheid te vinden. Vandaag zorgt dat voor constante afleiding door nieuwe prikkels zoals je telefoon.",
    situationImagePath: "assets/images/storyImages/10.verlaten_tent.png",
    explanationImagePath: "assets/images/explanationImages/2.ondekken_vs_scrollen_split.png",
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
    explanation: "Nieuwsgierigheid hielp om voedsel en veiligheid te vinden. Vandaag zorgt dat voor constante afleiding door nieuwe prikkels zoals je telefoon.",
    situationImagePath: "assets/images/storyImages/11.grot.png",
    explanationImagePath: "assets/images/explanationImages/2.ondekken_vs_scrollen_split.png",
  ),

  // ─── PERSOON NEGEERT JE (via tent) ───
  Situation(
    id: 12,
    description: "Iemand ziet je… hij ontwijkt oogcontact",
    choices: [
      Choice(id: 1, description: "Ga naar hem toe", outcome: 18),
      Choice(id: 2, description: "Loop door", outcome: 21),
      Choice(id: 3, description: "Verstop je", outcome: 16),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/12.persoon_negeert.png",
    explanationImagePath: "",
  ),

  // ─── WAPEN IN GROT ───
  Situation(
    id: 13,
    description: "Je vindt een wapen.",
    choices: [
      Choice(id: 1, description: "Ga terug", outcome: 14),
      Choice(id: 2, description: "Verken verder", outcome: 15),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/98.speer.png",
    explanationImagePath: "",
  ),

  // ─── MAAG KNORT ───
  Situation(
    id: 14,
    description: "Je honger wordt sterker.",
    choices: [
      Choice(id: 1, description: "Ga links", outcome: 16),
      Choice(id: 2, description: "Ga rechts", outcome: 17),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/14_honger_groeit.png",
    explanationImagePath: "",
  ),

  // ─── GROT EINDIGT, PERSOON NEGEERT JE ───
  Situation(
    id: 15,
    description: "De grot eindigt en iemand kijkt kort jouw kant op, en draait weer weg...",
    choices: [
      Choice(id: 1, description: "Ga naar hem toe", outcome: 18),
      Choice(id: 2, description: "Loop door", outcome: 17),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/15.grot_eindigd.png",
    explanationImagePath: "",
  ),

  // ─── GEEN VOEDSEL, PERSOON NEGEERT JE ───
  Situation(
    id: 16,
    description: "Geen voedsel, maar iemand ziet je, hij vermijdt oogcontact",
    choices: [
      Choice(id: 1, description: "Ga naar hem toe", outcome: 18),
      Choice(id: 2, description: "Loop door", outcome: 21),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/16.geen_voedsel.png",
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
    situationImagePath: "assets/images/storyImages/17.boom_met_fruit .png",
    explanationImagePath: "",
  ),

  // ─── PERSOON BLIJFT JE NEGEREN ───
  Situation(
    id: 18,
    description: "Hij blijft je negeren.",
    choices: [
      Choice(id: 1, description: "Praat", outcome: 97),
      Choice(id: 2, description: "Praat", outcome: 96),
      Choice(id: 3, description: "Val aan", outcome: 95),
      Choice(id: 4, description: "Val aan", outcome: 96),
    ],
    explanationNeeded: true,
    explanation: "Alleen zijn was gevaarlijk, dus het brein let sterk op sociale signalen. Vandaag kan geen reactie krijgen voelen als afwijzing, ook al is dat niet echt zo.",
    situationImagePath: "assets/images/storyImages/18_blijft_negeren.png",
    explanationImagePath: "assets/images/explanationImages/3.afwijzing_split.png",
  ),

  // ─── JE VERZAMELT ETEN ───
  Situation(
    id: 19,
    description: "Je verzamelt het eten.",
    choices: [
      Choice(id: 1, description: "Ga door", outcome: 20),
    ],
    explanationNeeded: true,
    explanation: "Voedsel was schaars, dus je moest eten zodra je het vond. Vandaag is eten overal, maar je brein werkt nog hetzelfde, wat leidt tot overeten.",
    situationImagePath: "assets/images/storyImages/19.eten_verzamelen.png",
    explanationImagePath: "assets/images/explanationImages/4.eten_split.png",
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
    explanation: "Het brein leerde vooruitdenken om risico's te vermijden. Vandaag leidt dat tot piekeren over dingen zoals werk of geld.",
    situationImagePath: "assets/images/storyImages/20.meer_eten.png",
    explanationImagePath: "assets/images/explanationImages/5.problemen_split.png",
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
    situationImagePath: "assets/images/storyImages/21.kruispunt_2.png",
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
    explanation: "Informatie was schaars, dus het brein bleef zoeken naar nieuwe info. Vandaag zorgt dat voor eindeloos scrollen en minder focus.",
    situationImagePath: "assets/images/storyImages/22.muurtekening_vaag.png",
    explanationImagePath: "assets/images/explanationImages/6.focus_split.png",
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
    explanation: "Informatie was schaars, dus het brein bleef zoeken naar nieuwe info. Vandaag zorgt dat voor eindeloos scrollen en minder focus.",
    situationImagePath: "assets/images/storyImages/23.muurtekening_alternatief.png",
    explanationImagePath: "assets/images/explanationImages/6.focus_split.png",
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
    situationImagePath: "assets/images/storyImages/24.beef_tekening.png",
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
    situationImagePath: "assets/images/storyImages/25.wolf_tekening.png",
    explanationImagePath: "",
  ),

  // ─── BEER ───
  Situation(
    id: 26,
    description: "Een enorme beer staat voor je.",
    choices: [
      Choice(id: 1, description: "Val aan", outcome: 93),
      Choice(id: 2, description: "Val aan", outcome: 92),
      Choice(id: 3, description: "Val aan", outcome: 99),
      Choice(id: 4, description: "Ren weg", outcome: 91),
      Choice(id: 5, description: "Ren weg", outcome: 99),
      Choice(id: 6, description: "Twijfel", outcome: 99),
    ],
    explanationNeeded: true,
    explanation: "Bij gevaar schakelde het lichaam direct over op actie (fight-or-flight). Vandaag gebeurt dat bij stress, wat kan leiden tot langdurige spanning.",
    situationImagePath: "assets/images/storyImages/26.beer_encounter.png",
    explanationImagePath: "assets/images/explanationImages/7.dreiging_vs_stress_split.png",
  ),

  // ─── WOLF ───
  Situation(
    id: 27,
    description: "Je komt een wolf tegen.",
    choices: [
      Choice(id: 1, description: "Val aan", outcome: 90),
      Choice(id: 2, description: "Val aan", outcome: 89),
      Choice(id: 3, description: "Val aan", outcome: 99),
      Choice(id: 4, description: "Ren weg", outcome: 88),
      Choice(id: 5, description: "Ren weg", outcome: 99),
      Choice(id: 6, description: "Twijfel", outcome: 99),
    ],
    explanationNeeded: true,
    explanation: "Bij gevaar schakelde het lichaam direct over op actie en instinct (fight-or-flight). Vandaag gebeurt dat bij stress, wat kan leiden tot langdurige spanning.",
    situationImagePath: "assets/images/storyImages/27.wolf_encounter.png",
    explanationImagePath: "assets/images/explanationImages/7.dreiging_vs_stress_split.png",
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
    situationImagePath: "assets/images/storyImages/88.wegvluchten_wolf.png",
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
    situationImagePath: "assets/images/storyImages/89.stam_helpt.png",
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
    situationImagePath: "assets/images/storyImages/90.wolf_verslaan.png",
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
    situationImagePath: "assets/images/storyImages/91.wegvluchten_beer.png",
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
    situationImagePath: "assets/images/storyImages/92.stam_helpt_bij_beer.png",
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
    situationImagePath: "assets/images/storyImages/93.beer_verslaan.png",
    explanationImagePath: "",
  ),

  // ─── STERVEN HONGER ───
  Situation(
    id: 94,
    description: "Het tekort aan voeding wordt je teveel..",
    choices: [
      Choice(id: 1, description: "Ga door", outcome: 99),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/94.sterven_honger.png",
    explanationImagePath: "",
  ),

  // ─── VERSLAAT HEM ───
  Situation(
    id: 95,
    description: "Je verslaat hem, hij had eten bij zich.",
    choices: [
      Choice(id: 1, description: "Verzamel het eten", outcome: 19),
      Choice(id: 2, description: "Ga door", outcome: 94),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/9.gevecht_gewonnen.png",
    explanationImagePath: "",
  ),

  // ─── VERLIEST GEVECHT ───
  Situation(
    id: 96,
    description: "Hij overmeestert je.",
    choices: [
      Choice(id: 1, description: "Ga door", outcome: 99),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/96.verliest_gevecht.png",
    explanationImagePath: "",
  ),

  // ─── KRIJGT ETEN ───
  Situation(
    id: 97,
    description: "Hij praat terug en geeft je wat eten.",
    choices: [
      Choice(id: 1, description: "Accepteer het eten", outcome: 19),
      Choice(id: 2, description: "Ga door", outcome: 94),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/storyImages/97.krijgt_eten.png",
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
    situationImagePath: "assets/images/storyImages/99.game_over.png",
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
    situationImagePath: "assets/images/storyImages/100.einde.png",
    explanationImagePath: "",
  ),
];

/// Jason-style flow based on the uploaded story map.
///
/// Notes:
/// - Only stress is meant to be tracked by the engine.
/// - Other labels like Energy +1 / Fat +1 are narrative cues in the choice text.
/// - The flow keeps the same overall sequence as the drawing, with route variants that converge again.

List<Situation> modern_situations = [
  // ─────────────────────────────────────────────────────────────
  // ENERGIE BESPAREN
  // ─────────────────────────────────────────────────────────────
  Situation(
    id: 1,
    description: "Het is 2026 en je wordt wakker gemaakt door een melding op je telefoon.",
    choices: [
      Choice(id: 1, description: "Blijf liggen", outcome: 2),
      Choice(id: 2, description: "Sta op", outcome: 3),
    ],
    explanationNeeded: true,
    explanation: "Energie besparen",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 2,
    description: "Je scrollt social media.",
    choices: [
      Choice(id: 1, description: "Blijf scrollen (Stress +1)", outcome: 4),
      Choice(id: 2, description: "Leg je telefoon weg", outcome: 5),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 3,
    description: "Je krijgt nog een melding.",
    choices: [
      Choice(id: 1, description: "Check je telefoon (Stress +1)", outcome: 4),
      Choice(id: 2, description: "Negeer de melding", outcome: 5),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─────────────────────────────────────────────────────────────
  // AFHANKELIJKHEID VAN DE GROEP
  // ─────────────────────────────────────────────────────────────
  Situation(
    id: 4,
    description: "Een vriend appt je en vraagt of je meegaat komende zondag.",
    choices: [
      Choice(id: 1, description: "Ga mee (Energy +1)", outcome: 6),
      Choice(id: 2, description: "Ga niet mee", outcome: 6),
    ],
    explanationNeeded: true,
    explanation: "Afhankelijkheid van de groep",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 5,
    description: "Je komt een vriend tegen en vraagt of je meegaat zondag.",
    choices: [
      Choice(id: 1, description: "Ga mee (Energy +1)", outcome: 6),
      Choice(id: 2, description: "Ga niet mee", outcome: 6),
    ],
    explanationNeeded: true,
    explanation: "Afhankelijkheid van de groep",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 6,
    description: "Je maag begint te knorren.",
    choices: [
      Choice(id: 1, description: "Bestel wat", outcome: 7),
      Choice(id: 2, description: "Ga wat halen (Energy +1)", outcome: 8),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─────────────────────────────────────────────────────────────
  // SCHAARSTE AAN VOEDSEL
  // ─────────────────────────────────────────────────────────────
  Situation(
    id: 7,
    description: "Online kom je een snackbar tegen.",
    choices: [
      Choice(id: 1, description: "Bestel snack (Fat +1)", outcome: 9),
      Choice(id: 2, description: "Scroll door", outcome: 9),
    ],
    explanationNeeded: true,
    explanation: "Schaarste aan voedsel",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 8,
    description: "Onderweg kom je een snackbar tegen.",
    choices: [
      Choice(id: 1, description: "Haal een snack (Fat +1)", outcome: 9),
      Choice(id: 2, description: "Loop door", outcome: 9),
    ],
    explanationNeeded: true,
    explanation: "Schaarste aan voedsel",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 9,
    description: "Je komt nog een snackbar tegen.",
    choices: [
      Choice(id: 1, description: "Haal nog een snack (Fat +1)", outcome: 9),
      Choice(id: 2, description: "Loop door", outcome: 10),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),
  Situation(
    id: 95,
    description: "Je komt nog een snackbar tegen.",
    choices: [
      Choice(id: 1, description: "Bestel nog een snack (Fat +1)", outcome: 95),
      Choice(id: 2, description: "Scroll door", outcome: 11),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),


  // ─────────────────────────────────────────────────────────────
  // NIEUWE KANSEN ONTDEKKEN
  // ─────────────────────────────────────────────────────────────
  Situation(
    id: 10,
    description: "Maar wat als er een nieuwe actie is?",
    choices: [
      Choice(id: 1, description: "Bestel wat gezonds (Energy +1)", outcome: 12),
      Choice(id: 2, description: "Bestel niks", outcome: 12),
      Choice(id: 3, description: "Bestel toch een snack (Fat +1)", outcome: 12),
    ],
    explanationNeeded: true,
    explanation: "Nieuwe kansen ontdekken",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 11,
    description: "Maar wat als er een nieuwe actie is?",
    choices: [
      Choice(id: 1, description: "Haal wat gezonds (Energy +1)", outcome: 93),
      Choice(id: 2, description: "Haal niks", outcome: 93),
      Choice(id: 3, description: "Haal toch een snack (Fat +1)", outcome: 9),
    ],
    explanationNeeded: true,
    explanation: "Nieuwe kansen ontdekken",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),
  Situation(
    id: 94,
    description: "Je besluit te gaan scrollen",
    choices: [
      Choice(id: 1, description: "Scroll Instagram", outcome: 12),
      Choice(id: 2, description: "Scroll Tiktok", outcome: 12),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),
  Situation(
    id: 93,
    description: "Je besluit terug naar huis te gaan",
    choices: [
      Choice(id: 1, description: "Ga linksom", outcome: 13),
      Choice(id: 2, description: "Ga rechtsom", outcome: 13),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),
  // ─────────────────────────────────────────────────────────────
  // HIËRARCHIE BINNEN DE GROEP
  // ─────────────────────────────────────────────────────────────
  Situation(
    id: 12,
    description: "Online zie je de perfecte levens van iedereen.",
    choices: [
      Choice(id: 1, description: "Vergelijk jezelf (Stress +1)", outcome: 14),
      Choice(id: 2, description: "Negeer het", outcome: 14),
    ],
    explanationNeeded: true,
    explanation: "Hiërarchie binnen de groep",
    situationImagePath: "assets/images/modern_12_hierarchy_online.png",
    explanationImagePath: "assets/images/expl_hierarchy.png",
  ),

  Situation(
    id: 13,
    description: "Je ziet een groep succesvolle jongens voorbij komen.",
    choices: [
      Choice(id: 1, description: "Vergelijk jezelf (Stess +1)", outcome: 15),
      Choice(id: 2, description: "Negeer het", outcome: 15),
    ],
    explanationNeeded: true,
    explanation: "Hiërarchie binnen de groep",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 14,
    description: "Je komt nog meer perfecte levens online tegen.",
    choices: [
      Choice(id: 1, description: "Vergelijk jezelf (Stress +1)", outcome: 16),
      Choice(id: 2, description: "Leg je telefoon weg", outcome: 16),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 15,
    description: "Je bent thuis aangekomen.",
    choices: [
      Choice(id: 1, description: "Pak je telefoon (Stress +1)", outcome: 16),
      Choice(id: 2, description: "Ga relaxen", outcome: 16),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─────────────────────────────────────────────────────────────
  // DIRECT GEVAAR
  // ─────────────────────────────────────────────────────────────
  Situation(
    id: 16,
    description: "Je baas belt ineens en wilt dat je gaat werken.",
    choices: [
      Choice(id: 1, description: "Ga aan het werk", outcome: 17),
      Choice(id: 2, description: "Ga niet aan het werk", outcome: 18),
    ],
    explanationNeeded: true,
    explanation: "Direct gevaar",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 17,
    description: "Dit is wel een pittige opdracht.",
    choices: [
      Choice(id: 1, description: "Gebruik het internet", outcome: 20),
      Choice(id: 2, description: "Gebruik een boek", outcome: 22),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 18,
    description: "Je bent ontslagen.",
    choices: [
      Choice(id: 1, description: "Zoek online voor nieuwe vacatures", outcome: 19),
      Choice(id: 2, description: "Pak een boek", outcome: 21),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─────────────────────────────────────────────────────────────
  // BEPERKTE INFORMATIE
  // ─────────────────────────────────────────────────────────────
  Situation(
    id: 21,
    description: "Je vindt geen enkel boek.",
    choices: [
      Choice(id: 1, description: "Gebruik het internet", outcome: 19),
      Choice(id: 2, description: "Blijf zoeken", outcome: 21),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 22,
    description: "Je vindt geen enkel boek.",
    choices: [
      Choice(id: 1, description: "Gebruik het internet", outcome: 20),
      Choice(id: 2, description: "Blijf zoeken", outcome: 22),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),


  Situation(
    id: 19,
    description: "Je wordt overrompeld door de hoeveelheid informatie.",
    choices: [
      Choice(id: 1, description: "Blijf zoeken (Stress +1)", outcome: 24),
      Choice(id: 2, description: "Stop met zoeken", outcome: 24),
    ],
    explanationNeeded: true,
    explanation: "Beperkte informatie",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 20,
    description: "Je wordt overrompeld door de hoeveelheid informatie.",
    choices: [
      Choice(id: 1, description: "assets/images/bear_situation.png", outcome: 23),
      Choice(id: 2, description: "assets/images/bear_situation.png", outcome: 23),
    ],
    explanationNeeded: true,
    explanation: "Beperkte informatie",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),



  // ─────────────────────────────────────────────────────────────
  // ONVOORSPELBARE OMGEVING
  // ─────────────────────────────────────────────────────────────
  Situation(
    id: 23,
    description: "Je moet wel echt de baan behouden, anders word je arm.",
    choices: [
      Choice(id: 1, description: "Blijf werken (If Energy 2)", outcome: 29),
      Choice(id: 2, description: "Blijf werken", outcome: 30),
      Choice(id: 3, description: "Blijf werken (If Fat 2)", outcome: 27),
      Choice(id: 4, description: "Blijf werken (If Stress 3)", outcome: 28),
      Choice(id: 5, description: "Stop met werken", outcome: 32),
    ],
    explanationNeeded: true,
    explanation: "Onvoorspelbare omgeving",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 24,
    description: "Je hebt wel echt een baan nodig, anders word je arm.",
    choices: [
      Choice(id: 1, description: "Blijf zoeken (If Energy 2)", outcome: 25),
      Choice(id: 2, description: "Blijf zoeken", outcome: 26),
      Choice(id: 3, description: "Blijf zoeken (If Fat 2)", outcome: 27),
      Choice(id: 4, description: "Blijf zoeken (If Stress 3)", outcome: 28),
      Choice(id: 5, description: "Stop met zoeken", outcome: 31),
    ],
    explanationNeeded: true,
    explanation: "Onvoorspelbare omgeving",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "assets/images/bear_situation.png",
  ),

  Situation(
    id: 25,
    description: "Je vindt een succesvolle baan!",
    choices: [
      Choice(id: 1, description: "Verder", outcome: 100),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 26,
    description: "Je vindt een matige baan, oké voor nu.",
    choices: [
      Choice(id: 1, description: "Verder", outcome: 101),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 27,
    description: "Je hebt geen energie meer en geeft op.",
    choices: [
      Choice(id: 1, description: "Opnieuw proberen", outcome: 102),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 28,
    description: "Je hebt teveel stress en geeft op.",
    choices: [
      Choice(id: 1, description: "Ga verder", outcome: 102),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 29,
    description: "Je hebt het goed gedaan en krijgt een promotie!",
    choices: [
      Choice(id: 1, description: "Ga verder", outcome: 100),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 30,
    description: "Je doet een matige prestatie, je houdt je baan voor nu.",
    choices: [
      Choice(id: 1, description: "Ga verder", outcome: 101),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 31,
    description: "Je vindt geen baan.",
    choices: [
      Choice(id: 1, description: "Ga verder", outcome: 102),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 32,
    description: "Je bent ontslagen.",
    choices: [
      Choice(id: 1, description: "Ga verder", outcome: 102),
    ],
    explanationNeeded: false,
    explanation: "",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  // ─────────────────────────────────────────────────────────────
  // END STATES (REFINED)
  // ─────────────────────────────────────────────────────────────

  Situation(
    id: 100,
    description: "Jaren later heb je een stabiele carrière en een comfortabel leven.",
    choices: [
      Choice(id: 1, description: "Opnieuw spelen", outcome: 1),
    ],
    explanationNeeded: false,
    explanation: "Jaren later heb je een stabiele en succesvolle carrière opgebouwd. Je leven is comfortabel en voorspelbaar geworden.",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 101,
    description: "Jaren later leef je een gemiddeld leven met werk, rust en af en toe stress.",
    choices: [
      Choice(id: 1, description: "Opnieuw spelen", outcome: 1),
    ],
    explanationNeeded: false,
    explanation: "Jaren later leid je een gemiddeld leven. Werk, vrije tijd en stress houden elkaar in balans, maar het voelt soms leeg en routinematig.",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),

  Situation(
    id: 102,
    description: "Jaren later ben je vooral bezig met stress en rondkomen.",
    choices: [
      Choice(id: 1, description: "Opnieuw spelen", outcome: 1),
    ],
    explanationNeeded: false,
    explanation: "Jaren later heeft je levensstijl je ingehaald. Stress en uitputting bepalen je dagelijks leven en stabiliteit is moeilijk geworden.",
    situationImagePath: "assets/images/bear_situation.png",
    explanationImagePath: "",
  ),
];


