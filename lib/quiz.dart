import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/result_screen.dart';
import 'package:quizz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start screen';
  List<String> selectedAnswers = [];
  int numTries = 1;

  void switchScreen() {
    setState(() {
      activeScreen = 'Questions Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start screen';
      numTries += 1; 
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'Questions Screen') {
      screenWidget = Questions(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result screen') {
      screenWidget = ResultScreen(chosenAnswer: selectedAnswers,
      onRestart: restartQuiz,numTries: numTries,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
