import 'package:flutter/material.dart';
import '../functions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    const Color correctBackground = Color.fromARGB(255, 150, 198, 241);
    const Color wrongBackground = Color.fromARGB(255, 249, 133, 241);
    Color Background;
    const Color correctFontColor = Color.fromARGB(255, 181, 254, 246);
    const Color wrongFontColor = Color.fromARGB(255, 202, 171, 252);
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              if (data['user_answer'] == data['correct_answer']) {
                Background = correctBackground;
              } else {
                Background = wrongBackground;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Background),
                      padding: EdgeInsets.all(12),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: TextStyle(
                              color: wrongFontColor,
                            ),
                          ),
                          Text(data['correct_answer'] as String,
                              style: TextStyle(color: correctFontColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
