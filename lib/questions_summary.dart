import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            summaryData.map((data) {
              final bool isCorrect = data['user_answer'] == data['correct_answer'];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Circular index number with color-coded background
                    CircleAvatar(
                      backgroundColor: isCorrect ? Colors.green : Colors.red,
                      radius: 15,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 15),

                    // User and correct answers
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Answer: ${data['user_answer']}",
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Correct Answer: ${data['correct_answer']}",
                            style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
