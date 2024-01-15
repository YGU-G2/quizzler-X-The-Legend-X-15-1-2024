import 'package:flutter/material.dart';
import 'package:quizzler/components/my_questions.dart';

class Questions extends StatelessWidget {
  const Questions({
    super.key,
    required this.questionsList,
  });

  final MyQuestions questionsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [          
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(12),
              color: const Color.fromARGB(40, 128, 0, 0),
              child: Text(
                questionsList.questionsText,
                style: const TextStyle(
                  color: Color(0xff800000),
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Icon(
          questionsList.icon,
          size: 84,
          color: const Color(0xff800000),
        ),
      ],
    );
  }
}