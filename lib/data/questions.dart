class Question {
  const Question({
    required this.text,
    required this.answers,
    required this.correctAnswer,
  });

  final String text;
  final List<String> answers;
  final String correctAnswer;
}

const questions = <Question>[
  Question(
    text: 'Na čo slúži metóda setState() vo Flutteri?',
    answers: [
      'Oznámi zmenu stavu a vyžiada aktualizáciu rozhrania',
      'Vymaže všetky dáta aplikácie',
      'Vytvorí nový projekt',
      'Automaticky otvorí ďalšiu obrazovku',
    ],
    correctAnswer: 'Oznámi zmenu stavu a vyžiada aktualizáciu rozhrania',
  ),
  Question(
    text: 'Čo vracia metóda where() pri práci so zoznamami v Darte?',
    answers: [
      'Iterable prvkov, ktoré spĺňajú zadanú podmienku',
      'Počet všetkých prvkov zoznamu',
      'Prvý prvok zoznamu',
      'Zoznam zoradený podľa abecedy',
    ],
    correctAnswer: 'Iterable prvkov, ktoré spĺňajú zadanú podmienku',
  ),
  Question(
    text: 'Ktorý widget umožňuje posúvanie obsahu na obrazovke?',
    answers: [
      'SingleChildScrollView',
      'Text',
      'Icon',
      'Center',
    ],
    correctAnswer: 'SingleChildScrollView',
  ),
  Question(
    text: 'Aký typ hodnoty očakáva backgroundColor vo widgete Scaffold?',
    answers: [
      'Color',
      'String',
      'int',
      'Widget',
    ],
    correctAnswer: 'Color',
  ),
  Question(
    text: 'Na čo slúži operátor ... (spread) v Darte?',
    answers: [
      'Vloží prvky jednej kolekcie do inej kolekcie',
      'Odstráni všetky prvky zoznamu',
      'Vytvorí nekonečný cyklus',
      'Pretypuje String na int',
    ],
    correctAnswer: 'Vloží prvky jednej kolekcie do inej kolekcie',
  ),
  Question(
    text: 'Čo platí pre StatelessWidget?',
    answers: [
      'Nemá vlastný meniteľný stav spravovaný objektom State',
      'Musí obsahovať metódu setState()',
      'Môže sa použiť iba na úvodnej obrazovke',
      'Nedokáže zobrazovať text',
    ],
    correctAnswer: 'Nemá vlastný meniteľný stav spravovaný objektom State',
  ),
  Question(
    text: 'Ktorá metóda transformuje každý prvok kolekcie?',
    answers: [
      'map()',
      'clear()',
      'removeLast()',
      'sort()',
    ],
    correctAnswer: 'map()',
  ),
  Question(
    text: 'Ktorá metóda náhodne zamieša prvky zoznamu?',
    answers: [
      'shuffle()',
      'where()',
      'join()',
      'contains()',
    ],
    correctAnswer: 'shuffle()',
  ),
];
