import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_app/answer_button.dart';
import 'package:flutter_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var _currentQuestionIndex = 0;

  void _answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      _currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[_currentQuestionIndex];
    TextStyle questionTextStyle = GoogleFonts.lato(
      color: const Color.fromARGB(255, 201, 153, 251),
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Tooltip(
              message: 'question',
              preferBelow: false,
              textAlign: TextAlign.center,
              textStyle: questionTextStyle,
              child: Text(
                currentQuestion.text,
                style: questionTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {
                    _answerQuestion(answer);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
