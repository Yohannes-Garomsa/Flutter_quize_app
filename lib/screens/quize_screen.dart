import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import 'package:quiz_app/screens/result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Question ${provider.currentIndex + 1}/${provider.questions.length}",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              provider.currentQuestion.questionText,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...provider.currentQuestion.options.map((option) {
              final isSelected = provider.selectedAnswer == option;
              final isCorrect =
                  option == provider.currentQuestion.correctAnswer;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? (isCorrect ? Colors.green : Colors.red)
                        : null,
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  onPressed: () => provider.selectAnswer(option),
                  child: Text(option, style: const TextStyle(fontSize: 18)),
                ),
              );
            }).toList(),
            const Spacer(),
            if (provider.isAnswered)
              ElevatedButton(
                onPressed: () {
                  if (provider.currentIndex == provider.questions.length - 1) {
                    provider.saveHighScore();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ResultScreen()),
                    );
                  } else {
                    provider.nextQuestion();
                  }
                },
                child: Text(
                  provider.currentIndex == provider.questions.length - 1
                      ? "See Results"
                      : "Next Question",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
