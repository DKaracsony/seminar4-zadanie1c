import 'package:flutter/material.dart';
import 'data/questions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.questions,
    required this.selectedAnswers,
  });

  final List<Question> questions;
  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...questions.asMap().entries.map((entry) {
          final index = entry.key;
          final question = entry.value;
          final selectedAnswer = selectedAnswers[index];
          final isCorrect = selectedAnswer == question.correctAnswer;

          return Card(
            color: const Color(0xFF312A52),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        isCorrect ? Icons.check_circle : Icons.cancel,
                        color: isCorrect
                            ? Colors.greenAccent
                            : Colors.orangeAccent,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${index + 1}. ${question.text}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Tvoja odpoveď: $selectedAnswer'),
                  if (!isCorrect) ...[
                    const SizedBox(height: 6),
                    Text(
                      'Správna odpoveď: ${question.correctAnswer}',
                      style: const TextStyle(color: Colors.greenAccent),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
