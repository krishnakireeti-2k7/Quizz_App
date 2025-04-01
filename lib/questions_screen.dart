import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;
  var image = 1;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
      image++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 10,
            ), //Wraped the Image Widget with Padding
            child: ClipRRect(
              // Wrapped the Image widget again with ClipRReact on top of Padding
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('assets/flags/f$image.jpg'),
            ),
          ),
          Text(
            currentQuestion.text,
            style: GoogleFonts.oswald(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          ...currentQuestion.getShuffledAns().map((answers) {
            return AnswerButton(
              text: answers,
              onTap: () {
                answerQuestion(answers);
              },
            );
          }),
        ],
      ),
    );
  }
}
