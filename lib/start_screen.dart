import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(opacity: 0.8, child: Image.asset('assets/quizz2.png')),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              'Guess The Country !',
              style: TextStyle(
                color: const Color.fromARGB(255, 240, 240, 36),
                fontSize: 40,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          SizedBox(height: 45),
          ElevatedButton.icon(
            onPressed: startQuiz,
            label: Text('Start'),
            icon: Icon(Icons.arrow_forward_ios_sharp),
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.amberAccent)),
          ),
        ],
      ),
    );
  }
}
