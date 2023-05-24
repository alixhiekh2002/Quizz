import 'package:flutter/material.dart';
import 'package:quiz_app/data/all_questions.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quizz.dart';
import 'package:quiz_app/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  var activescreen = "quiz-screen";
  void switchscreen() {
    setState(() {
      activescreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activescreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = StartScreen(switchscreen);
    if (activescreen == "question-screen") {
      screenwidget = Questions(OnselectedAns: chooseAnswer);
    }
    if (activescreen == "results-screen") {
      screenwidget = Results(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff4A148C), Color.fromARGB(255, 112, 7, 239)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: screenwidget,
        ),
      ),
    );
  }
}
