import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
    required this.numTries,
  });

  final List<String> chosenAnswer;
  final VoidCallback onRestart;
  final int numTries;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text('Attempts: $numTries', style: TextStyle(fontSize: 20)),
          SizedBox(height: 15),
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions correct',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          QuestionsSummary(summaryData),
          SizedBox(height: 20, width: 20),
          TextButton.icon(
            onPressed: onRestart,
            label: Text('Retry', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            icon: const Icon(Icons.refresh, size: 20),
          ),
        ],
      ),
    );
  }
}
