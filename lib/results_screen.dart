import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_app/data/questions.dart';
import 'package:flutter_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required List<String> chosenAnswers,
    required void Function() onRestart,
  })  : _onRestart = onRestart,
        _chosenAnswers = chosenAnswers;

  final List<String> _chosenAnswers;
  final void Function() _onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < _chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': _chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: DefaultTextStyle(
          style:
              GoogleFonts.lato(textStyle: const TextStyle(color: Colors.white)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: _onRestart,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28)),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  style: const TextStyle(fontSize: 28)),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
            ],
          ),
        ),
      ),
    );
  }
}
