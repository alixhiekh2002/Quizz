import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/all_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({required this.OnselectedAns, super.key});
  //Question(onselectedAnd m store hogya chooseAnswer)
  final void Function(String answer) OnselectedAns;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentQuestionindex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.OnselectedAns(selectedAnswer);
    // currentQuestionindex = currentQuestionindex + 1;
    setState(() {
      currentQuestionindex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentQuestionindex];
    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentquestion.getShuffleAnswer().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
