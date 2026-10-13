import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'start_screen.dart';

enum QuizStage { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuizStage _stage = QuizStage.start;
  int _currentQuestionIndex = 0;
  late List<Question> _quizQuestions;
  late List<List<String>> _answerOptions;
  final List<String> _selectedAnswers = [];

  void _startQuiz() {
    final shuffledQuestions = List<Question>.of(questions)..shuffle();
    final shuffledAnswers = shuffledQuestions.map((question) {
      return List<String>.of(question.answers)..shuffle();
    }).toList();

    setState(() {
      _quizQuestions = shuffledQuestions;
      _answerOptions = shuffledAnswers;
      _selectedAnswers.clear();
      _currentQuestionIndex = 0;
      _stage = QuizStage.questions;
    });
  }

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswers.add(answer);
      if (_currentQuestionIndex < _quizQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _stage = QuizStage.results;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    if (_stage == QuizStage.start) {
      screen = StartScreen(
        onStartQuiz: _startQuiz,
        questionCount: questions.length,
      );
    } else if (_stage == QuizStage.questions) {
      screen = QuestionsScreen(
        question: _quizQuestions[_currentQuestionIndex],
        answers: _answerOptions[_currentQuestionIndex],
        questionIndex: _currentQuestionIndex,
        totalQuestions: _quizQuestions.length,
        onSelectAnswer: _selectAnswer,
      );
    } else {
      screen = ResultsScreen(
        questions: _quizQuestions,
        selectedAnswers: _selectedAnswers,
        onRestartQuiz: _startQuiz,
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF14142E), Color(0xFF30225D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(child: screen),
      ),
    );
  }
}
