import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: quizProvider.currentQuestionIndex < quizProvider.questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  quizProvider.questions[quizProvider.currentQuestionIndex]
                      ['question'] as String,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...(quizProvider.questions[quizProvider.currentQuestionIndex]
                        ['options'] as List<String>)
                    .map((option) => ElevatedButton(
                          onPressed: () {
                            quizProvider.checkAnswer(option);
                          },
                          child: Text(option),
                        ))
                    .toList(),
                const SizedBox(height: 20),
                Text(
                  'Score: ${quizProvider.score}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            )
          : Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const ResultScreen()),
                  );
                },
                child: const Text('View Results'),
              ),
            ),
    );
  }
}
