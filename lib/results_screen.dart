import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.onRestartQuiz,
  });

  final List<Question> questions;
  final List<String> selectedAnswers;
  final VoidCallback onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    final correctCount = List.generate(
      questions.length,
      (index) => selectedAnswers[index] == questions[index].correctAnswer,
    ).where((isCorrect) => isCorrect).length;

    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.emoji_events_rounded,
            size: 64,
            color: Color(0xFFFFD166),
          ),
          const SizedBox(height: 10),
          const Text(
            'Výsledky kvízu',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '$correctCount / ${questions.length} správnych odpovedí',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Color(0xFFCCB4FF)),
          ),
          const SizedBox(height: 22),
          const Text(
            'Prehľad odpovedí',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: QuestionsSummary(
              questions: questions,
              selectedAnswers: selectedAnswers,
            ),
          ),
          const SizedBox(height: 14),
          FilledButton.icon(
            onPressed: onRestartQuiz,
            icon: const Icon(Icons.restart_alt_rounded),
            label: const Text('Restart Quiz'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
