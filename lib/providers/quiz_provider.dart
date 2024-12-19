import 'package:flutter/foundation.dart';

class QuizProvider with ChangeNotifier {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Rome', 'Berlin'],
      'answer': 'Paris',
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5', '6'],
      'answer': '4',
    },
  ];

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  List<Map<String, Object>> get questions => _questions;

  void checkAnswer(String option) {
    if (option == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }
    _currentQuestionIndex++;
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    notifyListeners();
  }
}
