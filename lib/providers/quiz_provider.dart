import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/utlis/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizeProvider with ChangeNotifier {
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  bool _isAnswered = false;
  int _highScore = 0;

  List<Question> get questions => dummyQuestions;

  int get currentIndex => _currentIndex;
  int get score => _score;
  String? get selectedAnswer => _selectedAnswer;
  bool get isAnswered => _isAnswered;
  int get highScore => _highScore;

  Future<void> loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    _highScore = prefs.getInt('highScore') ?? 0;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentIndex < questions.length - 1) {
      _currentIndex++;
      _selectedAnswer = null;
      _isAnswered = false;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _currentIndex = 0;
    _score = 0;
    _selectedAnswer = null;
    _isAnswered = false;
    notifyListeners();
  }

  Future<void> saveHighScore() async {
    if (_score > _highScore) {
      _highScore = _score;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('highScore', _highScore);
    }
  }
}
