import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'models/answer_button.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.question,
    required this.answers,
    required this.questionIndex,
    required this.totalQuestions,
    required this.onSelectAnswer,
  });

  final Question question;
  final List<String> answers;
  final int questionIndex;
  final int totalQuestions;
  final ValueChanged<String> onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    final progress = (questionIndex + 1) / totalQuestions;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('OTÁZKA ${questionIndex + 1} / $totalQuestions'),
              Text('${(progress * 100).round()} %'),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 26),
                  Text(
                    question.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 36),
                  ...answers.map(
                    (answer) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AnswerButton(
                        text: answer,
                        onPressed: () => onSelectAnswer(answer),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
